<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Setup & Configurations
        </span>
        <h3 class="page-title">Website Pages</h3>
      </div>
    </div>
    <hr>
    <!-- End Page Header -->

    <!-- Table -->
    <div class="card card-body p-0">
      <a-table :columns="columns" :data-source="data" :pagination="false">
        <span slot="url" slot-scope="text">
          <a :href="text" target="_blank">{{ text }}</a>
        </span>
        <span slot="action" slot-scope="text, record">
          <a-button @click="$router.push({name: record.admin})" icon="edit"/>
        </span>
      </a-table>
    </div>
    <!-- End Table -->

  </div>
</template>

<script>

import {frontend_url} from "@/core/config/app";

const columns = [
  {
    title: 'Name',
    dataIndex: 'name',
    key: 'name',
  },
  {
    title: 'Url',
    dataIndex: 'url',
    key: 'url',
    scopedSlots: {customRender: 'url'},
  },
  {
    title: 'Action',
    dataIndex: 'action',
    key: 'action',
    scopedSlots: {customRender: 'action'},
  },
];

export default {
  name: "Pages",
  data() {
    return {
      data: [],
      columns,
    };
  },
  methods: {
    loadData() {
      this.data.push(
          {
            key: '1',
            name: 'Home',
            url: frontend_url,
            admin: 'home-edit',
          },
          {
            key: '2',
            name: 'Frequently Asked Questions',
            url: frontend_url + 'faq',
            admin: 'faq-set',
          },
          {
            key: '3',
            name: 'Privacy Policy',
            url: frontend_url + 'privacy-policy',
            admin: 'privacy-edit',
          },
          {
            key: '4',
            name: 'Terms & Conditions',
            url: frontend_url + 'terms-conditions',
            admin: 'terms-edit',
          },
          {
            key: '5',
            name: 'About Us',
            url: frontend_url + 'about-us',
            admin: 'about-edit',
          }
      )
    }
  },
  created() {
    this.loadData();
  }
}
</script>

<style scoped>

</style>
