import Vue from "vue";
import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';
import moment from 'moment'
import {Form} from 'vform';
import {BootstrapVue} from "bootstrap-vue";
import {ClientTable} from 'vue-tables-2';
import Vue2Editor from "vue2-editor";
import VueSocialSharing from 'vue-social-sharing'

/*============================================
// npm install --save vue-scrollto
============================================= */
const VueScrollTo = require('vue-scrollto')
Vue.use(VueScrollTo,{duration: 2500})

window.Form = Form;
Vue.prototype.moment = moment
Vue.use(Antd);
Vue.use(BootstrapVue);
Vue.use(ClientTable, {}, false, 'bootstrap4', {});
Vue.use(Vue2Editor);
Vue.use(VueSocialSharing);

import {Swiper as SwiperClass, Pagination, Navigation, Mousewheel} from 'swiper/core'
import getAwesomeSwiper from 'vue-awesome-swiper/dist/exporter'
import 'swiper/swiper-bundle.css'

SwiperClass.use([Pagination, Navigation, Mousewheel])
Vue.use(getAwesomeSwiper(SwiperClass))
