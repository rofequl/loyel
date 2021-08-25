<template>
  <div class="p-3">
    <a-descriptions title="Store Details ">
      <a-descriptions-item label="Store Name">
        {{ seller.store.shop_name }}
      </a-descriptions-item>
      <a-descriptions-item label="Telephone">
        {{ seller.store.phone }}
      </a-descriptions-item>
      <a-descriptions-item label="Store Category">
        {{ seller.store.category }}
      </a-descriptions-item>
      <a-descriptions-item label="Store Logo">
        <a-avatar shape="square" size="large" :src="showImage(seller.store.shop_logo)"/>
      </a-descriptions-item>
      <a-descriptions-item label="Vacation Mode">
        <a-tag v-if="seller.store.vacation === 1">Active</a-tag>
        <a-tag v-else>Inactive</a-tag>
      </a-descriptions-item>
      <a-descriptions-item label="Business Type">
        <a-tag v-for="(business_type, i) in seller.store.business_type" :key="i" class="mt-2">{{
            business_type
          }}
        </a-tag>
      </a-descriptions-item>
    </a-descriptions>
    <a-divider/>
    <a-descriptions title="Financial Details ">
      <a-descriptions-item label="Type of ID">
        {{
          financial.id_type === 1 ? 'Passport' : financial.id_type === 2 ? 'Driving License' : financial.id_type === 3 ? 'Voter ID' : ''
        }}
      </a-descriptions-item>
      <a-descriptions-item label="ID Code">
        {{ financial.id_code }}
      </a-descriptions-item>
      <a-descriptions-item label="Bank Name">
        {{ financial.bank_name }}
      </a-descriptions-item>
      <a-descriptions-item label="Branch Name">
        {{ financial.bank_branch_name }}
      </a-descriptions-item>
      <a-descriptions-item label="Bank Account Name">
        {{ financial.bank_account_name }}
      </a-descriptions-item>
      <a-descriptions-item label="Bank Account Number">
        {{ financial.bank_account_number }}
      </a-descriptions-item>
      <a-descriptions-item label="Bank Routing Number">
        {{ financial.bank_routing_number }}
      </a-descriptions-item>
      <a-descriptions-item label="TIN Number">
        {{ financial.tin_number }}
      </a-descriptions-item>
    </a-descriptions>
    <a-divider/>
    <a-descriptions title="Contact Details">
      <a-descriptions-item label="Region">
        {{userContact.region}}
      </a-descriptions-item>
      <a-descriptions-item label="City">
        {{userContact.city}}
      </a-descriptions-item>
      <a-descriptions-item label="Area">
        {{userContact.area}}
      </a-descriptions-item>
      <a-descriptions-item label="Address">
        {{userContact.address}}
      </a-descriptions-item>
    </a-descriptions>
  </div>
</template>

<script>
export default {
  name: "StoreDetails",
  props: {
    seller: {
      required: true
    },
  },
  computed: {
    financial() {
      return this.seller.financial;
    },
    userContact() {
      return this.seller.contact;
    }
  }
}
</script>

<style scoped>

</style>
