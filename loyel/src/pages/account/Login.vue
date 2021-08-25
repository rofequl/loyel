<template>
  <div>
    <IsSellerLog v-if="type === 'seller'"/>
    <CheckEmail v-if="type === 'check'" @checkSubmit="checkSubmit"/>
    <SellerRegister :email="email" :mobile="mobile" :reg_type="reg_type" v-else-if="type === 'register'"/>
    <SellerLogin :emailOrMobile="emailOrMobile" :reg_type="reg_type" v-else-if="type === 'login'"/>
    <LoginFooter/>
  </div>
</template>

<script>
import SellerLogin from "@/components/login/SellerLogin";
import SellerRegister from "@/components/login/SellerRegister";
import CheckEmail from "@/components/login/CheckEmail";
import LoginFooter from "@/components/helper/LoginFooter";
import IsSellerLog from "@/components/login/IsSellerLog";
import {mapGetters} from "vuex";

export default {
  name: "Login",
  data() {
    return {
      reg_type: 0,
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
      e.data.user_type === 2 ? this.reg_type = 2 : this.reg_type = 0;
    }
  },
  components: {IsSellerLog, SellerLogin, SellerRegister, CheckEmail, LoginFooter},
  created() {
    if (this.isSellerOrLogin) this.type = 'seller';
  },
  computed: {
    ...mapGetters(["isSellerOrLogin"])
  },
}
</script>

<style scoped>

</style>
