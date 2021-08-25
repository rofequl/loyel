<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">{{ $t('setup.general.smallTitle') }}
        </span>
        <h3 class="page-title">{{ $t('setup.general.bigTitle') }}</h3>
      </div>
    </div>
    <!-- End Page Header -->

    <CRow class="my-4">
      <CCol md="8">
        <CCardGroup>
          <CCard class="p-4">
            <GeneralInput/>
          </CCard>
        </CCardGroup>
        <CCardGroup class="mt-4">
          <CCard>
            <CCardHeader>
              {{ $t('setup.general.footer') }}
            </CCardHeader>
            <CCardBody>
              <Footer/>
            </CCardBody>
          </CCard>
        </CCardGroup>
      </CCol>
      <CCol md="4">
        <Language/>
        <Maintenance/>
        <ProductVerify/>
        <SellerVerify/>
        <Contact/>
      </CCol>
    </CRow>

  </div>
</template>

<script>
import GeneralInput from "@/components/setup/general/GeneralInput";
import Language from "@/components/setup/general/Language";
import Maintenance from "@/components/setup/general/Maintenance";
import Contact from "@/components/setup/general/Contact";
import Footer from "@/components/setup/general/Footer";
import SellerVerify from "@/components/setup/general/SellerVerify";
import ProductVerify from "@/components/setup/general/ProductVerify";

export default {
  name: "General",
  components: {Maintenance, Language, GeneralInput, Contact, Footer, SellerVerify, ProductVerify}
}
</script>

<style scoped>

</style>
