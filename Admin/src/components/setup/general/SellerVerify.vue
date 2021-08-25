<template>
  <CCard>
    <CCardHeader>
      Seller Verify Needed?
    </CCardHeader>
    <CCardBody>
      <CRow class="">
        <CCol md="12">
          <a-switch :checked="isSellerVerify" @change="onChange"/>
        </CCol>
      </CRow>
    </CCardBody>
  </CCard>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "SellerVerify",
  data: () => ({
    formItemLayout: {
      labelCol: {span: 6},
      wrapperCol: {span: 14},
    },
  }),
  methods: {
    ...mapActions(['SELLER_VERIFY_ACTIVE']),
    onChange(checked) {
      const {SELLER_VERIFY_ACTIVE} = this;
      if (checked)
        SELLER_VERIFY_ACTIVE({active: 1})
      else
        SELLER_VERIFY_ACTIVE({active: 0})
    },
  },
  computed: {
    ...mapGetters(["isSellerVerify"])
  },
}
</script>

<style scoped>

</style>
