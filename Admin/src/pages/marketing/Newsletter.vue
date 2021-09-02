<template>
  <a-spin tip="Loading..." :spinning="loading">
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Marketing
        </span>
        <h3 class="page-title">Send Newsletter</h3>
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
                  Emails :
                </CCol>
                <CCol md="9">
                  <vue-multi-select
                      v-model="form.email"
                      search
                      :filters="filters"
                      :options="options"
                      :btnLabel="btnLabel"
                      :selectOptions="newsletterList"/>
                </CCol>
              </CRow>
              <CRow class="mt-4">
                <CCol md="3">
                  Newsletter subject :
                </CCol>
                <CCol md="9">
                  <a-input v-model="form.subject" placeholder="Enter Newsletter Subject"/>
                </CCol>
              </CRow>
              <CRow class="mt-4">
                <CCol md="3">
                  Newsletter content :
                </CCol>
                <CCol md="9">
                  <vue-editor v-model="form.message"/>
                </CCol>
              </CRow>
              <a-button htmlType="submit" type="primary" :loading="form.busy" :disabled="form.busy"
                        class="float-right my-3">
               Send <CIcon name="cib-gmail" class="ml-2 mt-2-m"/>
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
import vueMultiSelect from 'vue-multi-select';
import 'vue-multi-select/dist/lib/vue-multi-select.css';

export default {
  name: "Newsletter",
  components: {vueMultiSelect},
  async mounted() {
    this.loading = true
    if (!this.newsletterList[0].elements.length > 0) await this.$store.dispatch('NEWSLETTER_LIST');
    this.loading = false
  },
  data() {
    return {
      loading: false,
      form: new Form({
        email: [],
        subject: '',
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
      btnLabel: values => `${values.length} email selected`,
    }
  },
  methods: {
    onSubmit() {
      this.form.post('newsletter-send')
          .then(() => {
            this.form.reset()
            this.$notification['success']({
              message: 'congratulations',
              description: 'Newsletter send successfully.',
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
    ...mapGetters(["newsletterList"]),
  }
}
</script>

<style scoped>

</style>
