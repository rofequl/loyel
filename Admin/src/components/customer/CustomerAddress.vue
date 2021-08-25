<template>
  <div style="display: flow-root">
    <a-table :columns="columns" :data-source="addressBook" :pagination="false" rowKey="id" bordered>
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
    </a-table>
  </div>
</template>

<script>

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
];


export default {
  name: "CustomerAddress",
  props: {
    addressBook: {
      required: true
    },
  },
  data() {
    return {
      columns,
    };
  },
}
</script>

<style scoped>

</style>
