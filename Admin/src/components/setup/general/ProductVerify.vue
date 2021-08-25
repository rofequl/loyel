<template>
  <CCard>
    <CCardHeader>
      Product Verify Needed?
    </CCardHeader>
    <CCardBody>
      <CRow class="">
        <CCol md="12">
          <a-switch :checked="isProductVerify" @change="onChange"/>
        </CCol>
      </CRow>
    </CCardBody>
  </CCard>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "ProductVerify",
  data: () => ({
    formItemLayout: {
      labelCol: {span: 6},
      wrapperCol: {span: 14},
    },
  }),
  methods: {
    ...mapActions(['PRODUCT_VERIFY_ACTIVE']),
    onChange(checked) {
      const {PRODUCT_VERIFY_ACTIVE} = this;
      if (checked)
        PRODUCT_VERIFY_ACTIVE({active: 1})
      else
        PRODUCT_VERIFY_ACTIVE({active: 0})
    },
  },
  computed: {
    ...mapGetters(["isProductVerify"])
  },
}
</script>

<style scoped>

</style>
