<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Setup & Configurations
        </span>
        <h3 class="page-title">Terms & Conditions Page Settings</h3>
      </div>
    </div>
    <hr>
    <!-- End Page Header -->

    <CRow class="my-4 justify-content-center">
      <CCol>
        <CCard>
          <CCardBody>
            <a-form-model ref="ruleForm" @submit.prevent="onSubmit()">
              <vue-editor :value="terms_condition" @input="e =>{$store.commit('SET_TERMS_PAGE', e)}"/>
              <a-button type="primary" :loading="busy" :disabled="busy" @click="onSubmit" class="float-right mt-4">
                Update
              </a-button>
            </a-form-model>
          </CCardBody>
        </CCard>
      </CCol>
    </CRow>
  </div>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Terms",
  data() {
    return {
      busy: false,
    }
  },
  methods: {
    ...mapActions(['PAGE_UPDATE']),
    onSubmit() {
      this.busy = true;
      this.PAGE_UPDATE().finally(() => {
        this.$notification['success']({
          message: 'congratulations',
          description: 'Terms & Conditions update successfully.',
          style: {marginTop: '41px'},
        });
        this.busy = false;
      })
    }
  },
  created() {
    if (this.terms_condition === '') this.$store.dispatch('PAGE_SETUP');
  },
  computed: {
    ...mapGetters(["terms_condition"])
  },
}
</script>

<style scoped>

</style>
