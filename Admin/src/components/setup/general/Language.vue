<template>
  <CCard>
    <CCardHeader>
      {{$t('setup.general.bangla')}}
    </CCardHeader>
    <CCardBody>
      <CRow class="">
        <CCol md="3">
          <a-switch :checked="isBangla" @change="onChange"/>
        </CCol>
        <CCol md="9">
          <a-select v-if="isBangla" :value="defaultLanguage" style="width: 100%" @change="setLanguage">
            <a-select-option :value="1">
              English
            </a-select-option>
            <a-select-option :value="2">
              বাংলা
            </a-select-option>
          </a-select>
        </CCol>
      </CRow>
    </CCardBody>
  </CCard>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Language",
  data: () => ({
    formItemLayout: {
      labelCol: {span: 6},
      wrapperCol: {span: 14},
    },
  }),
  methods: {
    ...mapActions(['BANGLA_ACTIVE', 'DEFAULT_LANGUAGE']),
    onChange(checked) {
      const {BANGLA_ACTIVE} = this;
      if (checked)
        BANGLA_ACTIVE({active: 1})
      else
        BANGLA_ACTIVE({active: 2})
    },
    setLanguage(value) {
      this.DEFAULT_LANGUAGE({type: value})
    },
  },
  computed: {
    ...mapGetters(["isBangla", "defaultLanguage"])
  },
}
</script>

<style scoped>

</style>
