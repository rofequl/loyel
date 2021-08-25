<template>
  <CCard>
    <CCardHeader>
      {{$t('setup.general.maintenance')}}
    </CCardHeader>
    <CCardBody>
      <CRow class="">
        <CCol md="3">
          <a-switch :checked="isMaintenance" @change="onChange"/>
        </CCol>
        <CCol md="9">
          <a-date-picker v-if="isMaintenance" format="YYYY-MM-DD HH:mm:ss"
                         :show-time="{ defaultValue: moment('00:00:00', 'HH:mm:ss') }" @change="defaultLanguage"/>
        </CCol>
      </CRow>
    </CCardBody>
  </CCard>
</template>

<script>
import {mapActions, mapGetters} from "vuex";
import moment from 'moment';

export default {
  name: "Maintenance",
  data: () => ({
    formItemLayout: {
      labelCol: {span: 6},
      wrapperCol: {span: 14},
    },
  }),
  methods: {
    ...mapActions(['MAAINTENANCE_ACTIVE']),
    moment,
    onChange(checked) {
      const {MAAINTENANCE_ACTIVE} = this;
      if (checked)
        MAAINTENANCE_ACTIVE({active: 1})
      else
        MAAINTENANCE_ACTIVE({active: 2})
    },
    defaultLanguage(value) {
      console.log(`Language ${value}`);
    },
  },
  computed: {
    ...mapGetters(["isMaintenance"])
  },
}
</script>

<style scoped>

</style>
