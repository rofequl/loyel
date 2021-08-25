<template>
  <div style="display: flow-root">
    <p class="float-right pointer mb-2" style="font-size: 14px;color: #4a99d8">Make default shipping address</p>
    <div class="clearfix"></div>
    <a-table :columns="columns" :data-source="addressList" :pagination="false" rowKey="id">
              <span slot="address" slot-scope="text, record">
                <a-tag v-if="record.address_type === 0" color="#2db7f5">HOME</a-tag>
                <a-tag v-else color="#108ee9">OFFICE</a-tag>{{ text }}
              </span>
      <span slot="shipment" slot-scope="text, record">
                {{ record.region }} - {{ record.city }} - {{ record.area }}
              </span>
      <span slot="shipment" slot-scope="text, record">
                {{ record.region }} - {{ record.city }} - {{ record.area }}
              </span>
      <span slot="default_shipping" slot-scope="text">
                <span style="font-size: 12px;color: #2db7f5">{{ text === 0 ? 'Default Shipping Address' : '' }}</span>
              </span>
      <span slot="action" slot-scope="text, record">
                EDIT
              </span>
    </a-table>
    <a-button @click="$emit('newAddress')" class="float-right mt-4  text-white"
              style="background-color: #4ca846">
      <i class="fa fa-plus mr-1"></i> ADD NEW ADDRESS
    </a-button>
  </div>
</template>

<script>

import {mapGetters} from "vuex";

const columns = [
  {
    title: 'Full Name',
    dataIndex: 'full_name',
    key: 'full_name',
  },
  {
    title: 'Address',
    dataIndex: 'address',
    key: 'address',
    scopedSlots: {customRender: 'address'},
  },
  {
    title: 'Region',
    dataIndex: 'shipment',
    key: 'shipment',
    scopedSlots: {customRender: 'shipment'},
  },
  {
    title: 'Phone Number',
    dataIndex: 'phone_number',
    key: 'phone_number',
  },
  {
    title: '',
    dataIndex: 'default_shipping',
    key: 'default_shipping',
    scopedSlots: {customRender: 'default_shipping'},
  },
  {
    title: '',
    dataIndex: 'action',
    key: 'action',
    scopedSlots: {customRender: 'action'},
  },
];

const data = [];

export default {
  name: "AddressList",
  data() {
    return {
      data,
      columns,
    };
  },
  created() {
    if (!this.addressList.length > 0) this.$store.dispatch('ADDRESS_LIST');
  },
  computed: {
    ...mapGetters(["addressList"])
  }
}
</script>

<style scoped>

</style>
