<template>
  <div>
    <a-card style="width: 100%;border-radius: 20px" class="mt-4 p-0 bg-light">
      <h5 class="font-weight-bold">Shipping Information</h5>
      <div class="row mt-4">
        <div class="col-12">
          <span v-if="addressList.length === 0" @click="addressModel = true" style="color: #00aced; font-size: 12px"
                class="pointer">+ Add new address</span>
          <div v-else>
            <div>
              <a href="edit" style="color: #00aced; font-size: 12px" class="float-right" @click.prevent="addressModel = true">EDIT</a>
              <i class="fa fa-map-marker mr-2"></i> <span
                class="font-weight-bold">{{ defaultAddress.full_name }}</span><br>
              <span
                  style="margin-left: 24px">{{ defaultAddress.address }}, {{
                  defaultAddress.area
                }}, {{ defaultAddress.city }}, {{ defaultAddress.region }}</span>
            </div>
            <div class="mt-2"><i class="fa fa-phone" style="margin-right: 1px"></i>
              {{ defaultAddress.phone_number }}
            </div>
            <div class="mt-2"><i class="fas fa-envelope" style="margin-right: 6px"></i>
              {{ currentUser.email }}
              <a href="edit" style="color: #00aced;font-size: 12px" class="float-right" @click.prevent="emailModel = true">
                {{ currentUser.email ? "EDIT" : "ADD" }}
              </a>
            </div>
          </div>
        </div>
      </div>
    </a-card>
    <Address :modelOpen="addressModel" @closeModel="addressModel = false"/>
    <Email :modelOpen="emailModel" :is-update="!!currentUser.email" @closeModel="emailModel = false"
           :name="currentUser.name"/>
  </div>
</template>

<script>
import Address from "@/components/cart/Address";
import Email from "@/components/customer/Email";
import {mapGetters} from "vuex";

export default {
  name: "Shipping",
  components: {Address, Email},
  data() {
    return {
      addressModel: false,
      emailModel: false,
    }
  },
  created() {
    if (!this.addressList.length > 0) this.$store.dispatch('ADDRESS_LIST');
  },
  computed: {
    ...mapGetters(["addressList", "defaultAddress", "currentUser"])
  }
}
</script>

<style scoped>

</style>
