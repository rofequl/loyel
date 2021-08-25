import Vue from 'vue'
import {api_base_url} from "@/core/config/app";

Vue.mixin({
    methods: {
        showImage(e) {
            if (e) return api_base_url + e;
        },
        numberWithCommas(e) {
            let formatter = new Intl.NumberFormat('en-IN');
            return formatter.format(e);
        },
        encode: e => btoa(e),
        decode: e => atob(e)
    }
})
