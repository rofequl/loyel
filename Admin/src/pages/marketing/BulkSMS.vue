<template>
  <a-spin tip="Loading..." :spinning="loading">
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Marketing
        </span>
        <h3 class="page-title">Send Bulk SMS</h3>
      </div>
    </div>
    <!-- End Page Header -->
    <CRow class="my-4 justify-content-center">
      <CCol md="10">
        <CCardGroup>
          <CCard class="p-4">
            <a-form-model ref="ruleForm" :model="form"
                          @submit.prevent="onSubmit()" @keydown="form.onKeydown($event)">
              <CRow class="">
                <CCol md="3">
                  Mobile Number :
                </CCol>
                <CCol md="9">
                  <vue-multi-select
                      v-model="form.mobile"
                      search
                      :filters="filters"
                      :options="options"
                      :btnLabel="btnLabel"
                      :selectOptions="bulkSMSList"/>
                </CCol>
              </CRow>
              <CRow class="mt-4">
                <CCol md="3">
                  Message :
                </CCol>
                <CCol md="9">
                  <a-input v-model="form.message" placeholder="Enter message you want to send"/>
                </CCol>
              </CRow>
              <a-button htmlType="submit" type="primary" :loading="form.busy" :disabled="form.busy"
                        class="float-right my-3">
                Send Message
              </a-button>
            </a-form-model>
          </CCard>
        </CCardGroup>
      </CCol>
    </CRow>

  </a-spin>
</template>

<script>
import {mapGetters} from "vuex";
import vueMultiSelect from "vue-multi-select";
import 'vue-multi-select/dist/lib/vue-multi-select.css';

export default {
  name: "BulkSMS",
  components: {vueMultiSelect},
  async mounted() {
    this.loading = true
    if (!this.bulkSMSList[0].elements.length > 0) await this.$store.dispatch('BULKSMS_LIST');
    this.loading = false
  },
  data() {
    return {
      loading: false,
      // eslint-disable-next-line no-undef
      form: new Form({
        mobile: [],
        message: '',
      }),
      values: [],
      filters: [{
        nameAll: "Select All",
        nameNotAll: "Deselect All",
        func() {
          return true;
        },
      }],
      options: {
        multi: true,
        groups: true,
        labelList: 'elements',
        groupName: 'title',
      },
      btnLabel: values => `${values.length} number selected`,
    }
  },
  methods: {
    onSubmit() {
      this.form.post('send-bulk-sms')
          .then(() => {
            this.form.reset()
            this.$notification['success']({
              message: 'congratulations',
              description: 'Message send successfully.',
              style: {marginTop: '41px'},
            });
          })
          .catch(err => {
            this.$notification['error']({
              message: 'Warning',
              description: ((err.response || {}).data || {}).message || 'Something Wrong',
              style: {marginTop: '41px'},
              duration: 4
            })
          })
    }
  },
  computed: {
    ...mapGetters(["bulkSMSList"]),
  }
}
</script>

<style scoped>

</style>
