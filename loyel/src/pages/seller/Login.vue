<template>
  <div>
    <IsCustomerLog v-if="type === 'customer'"/>
    <CheckEmail v-if="type === 'check'" @checkSubmit="checkSubmit"/>
    <SellerRegister @check="type = 'check'" :email="email" :mobile="mobile" :reg_type="reg_type"
                    v-else-if="type === 'register'"/>
    <SellerLogin @check="type = 'check'" :emailOrMobile="emailOrMobile" :reg_type="reg_type"
                 v-else-if="type === 'login'"/>
    <LoginFooter/>
  </div>
</template>

<script>
import LoginFooter from "@/components/helper/LoginFooter";
import CheckEmail from "@/components/login/CheckEmail";
import SellerRegister from "@/components/login/SellerRegister";
import SellerLogin from "@/components/login/SellerLogin";
import IsCustomerLog from "@/components/login/IsCustomerLog";
import {mapGetters} from "vuex";

export default {
  name: "Login",
  data() {
    return {
      reg_type: 2,
      type: 'check',
      email: '',
      mobile: '',
      emailOrMobile: '',
    }
  },
  methods: {
    checkSubmit(e) {
      this.type = e.data.transfer;
      this.emailOrMobile = e.emailOrMobile;
      e.data.type === 'email' ? this.email = e.emailOrMobile : this.mobile = e.emailOrMobile;
      e.data.user_type === 0 ? this.reg_type = 0 : this.reg_type = 2;
    }
  },
  components: {IsCustomerLog, SellerLogin, SellerRegister, CheckEmail, LoginFooter},
  created() {
    if (this.isCustomerOrLogin) this.type = 'customer';
  },
  computed: {
    ...mapGetters(["isCustomerOrLogin"])
  },
}
</script>

<style scoped>

</style>
