import Vue from "vue";
import CoreuiVue from '@coreui/vue'
import {BootstrapVue} from "bootstrap-vue";
import Antd from 'ant-design-vue';
import 'ant-design-vue/dist/antd.css';
import {Form} from 'vform';
import {ClientTable} from 'vue-tables-2';
import Vue2Editor from "vue2-editor";
import _ from 'lodash';
import moment from 'moment'
import Print from 'vue-print-nb'

Vue.prototype._ = _
Vue.prototype.moment = moment

Vue.use(CoreuiVue)
Vue.use(BootstrapVue);
Vue.use(Antd);
Vue.use(Print);
window.Form = Form;
Vue.use(ClientTable, {}, false, 'bootstrap4', {});
Vue.use(Vue2Editor);
Vue.use(require('vue-moment'));
