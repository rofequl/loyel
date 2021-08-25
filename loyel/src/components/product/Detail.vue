<template>
  <div>
    <a-card class="border-top"
        style="width:100%"
        :tab-list="tabListNoTitle"
        :active-tab-key="noTitleKey"
        @tabChange="key => onTabChange(key, 'noTitleKey')"
    >
      <div v-if="noTitleKey === 'tab1'" class="product-desc-content" v-html="product.description"></div>
      <p v-else-if="noTitleKey === 'tab2'"></p>
      <div v-else>
        <h4 class="text-center text-muted">There have been no reviews for this product yet.</h4>
      </div>
    </a-card>
  </div>
</template>

<script>
export default {
  props: {
    product: {
      type: [Object],
      required: true,
    },
  },
  name: "Detail",
  data() {
    return {
      tabListNoTitle: [
        {
          key: 'tab1',
          tab: 'OVERVIEW',
        },
        {
          key: 'tab2',
          tab: 'VIDEO',
        },
        {
          key: 'tab3',
          tab: 'CUSTOMER REVIEWS',
        },
      ],
      noTitleKey: 'tab1',
    };
  },
  methods: {
    onTabChange(key, type) {
      this[type] = key;
    },
  },
}
</script>

<style scoped>
.product-desc-content >>> img {
  width: 100%;
}
</style>
