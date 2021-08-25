import Vue from "vue";
import store from "@/store"
import axios from "axios";
import VueAxios from "vue-axios";
import JwtService from "@/core/services/jwt.service";

import router from "../../router";
import {api_base_url} from "../config/app";


const ApiService = {
    init() {
        Vue.use(VueAxios, axios);
        Vue.axios.defaults.baseURL = api_base_url;
        Vue.axios.interceptors.response.use(responce => {
            return Promise.resolve(responce);
        }, (error) => {
            if (error.response.status == 500) {
                router.push({name: 'error-500'});
                return new Promise((resolve, reject) => {
                    reject(error);
                });
            }

            if (error.response.status === 404) {
                router.push({name: 'error-404'});
                return new Promise((resolve, reject) => {
                    reject(error);
                });
            }

            if (error.response.status !== 401) {
                return new Promise((resolve, reject) => {
                    reject(error);
                });
            }

            if (error.config.url == 'token/refresh' || error.response.data.message == 'Token Invalid' || error.response.data.message == 'Email and password are not match') {
                if (error.response.data.message == 'Token Invalid') {
                    store.dispatch('LOGOUT');
                    router.push({name: 'admin-login'});
                }
                return new Promise((resolve, reject) => {
                    reject(error);
                });
            }

            return this.post('token/refresh')
                .then(({data}) => {
                    JwtService.destroyToken();
                    store.commit('SET_AUTH', data)
                    const config = error.config;
                    config.headers['Authorization'] = `Bearer ${JwtService.getToken()}`;
                    this.setHeader();
                    return new Promise((resolve, reject) => {
                        axios.request(config).then(response => {
                            resolve(response);
                        }).catch((error) => {
                            reject(error);
                        })
                    });
                })
                .catch((error) => {
                    Promise.reject(error);
                });
        });
    },


    setHeader() {
        Vue.axios.defaults.headers.common[
            "Authorization"
            ] = `Bearer ${JwtService.getToken()}`;
    },

    query(resource, params) {
        return Vue.axios.get(resource, params).catch(error => {
            console.log(error);
            throw new Error(`[KT] ApiService ${error}`);
        });
    },

    get(resource, slug = "") {
        return Vue.axios.get(`${resource}` + (slug ? slug : '')).catch(error => {
            throw new Error(`[KT] ApiService ${error}`);
        });
    },

    post(resource, params) {
        return Vue.axios.post(`${resource}`, params);
    },

    update(resource, slug, params) {
        return Vue.axios.put(`${resource}/${slug}`, params);
    },

    put(resource, params) {
        if (params instanceof FormData)
            params.append('_method', 'put');
        else
            params['_method'] = 'put';

        return this.post(resource, params);
    },

    delete(resource, params) {
        return Vue.axios.delete(resource, params).catch(error => {
            throw new Error(`[RWV] ApiService ${error}`);
        });
    }
};

export default ApiService;
