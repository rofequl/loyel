<template>
  <CCard>
    <CCardHeader>
      Top Brand List :
      <a-tooltip placement="topRight">
        <template slot="title">
          <span>To active this switch you can set the top brand list.</span>
        </template>
        <a-switch class="float-right" checked-children="Yes" un-checked-children="No"
                  :checked="isTopBrand" @change="onChange"/>
      </a-tooltip>
    </CCardHeader>
    <CCardBody v-if="isTopBrand">
      <b-form @submit.prevent="update()" @keydown="form.onKeydown($event)">
        <a-select
            v-model="form.brand_list"
            mode="multiple"
            style="width: 100%"
            placeholder="select the brand"
            option-label-prop="label"
        >
          <a-select-option v-for="brand in brandList" :key="brand.id" :value="brand.id" :label="brand.name">
          <span role="img">
            <img :src="showImage(brand.logo)" class="mx-2" width="18px" height="18px" alt="Category">
          </span>
            {{ brand.name }}
          </a-select-option>
        </a-select>
        <a-button htmlType="submit" type="primary" :loading="form.busy" :disabled="form.busy" class="float-right my-3">
          Update
        </a-button>
      </b-form>
    </CCardBody>
  </CCard>
</template>

<script>
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Brand",
  data() {
    return {
      form: new Form({
        brand_list: [],
      })
    }
  },
  methods: {
    ...mapActions(['TOP_BRAND_ACTIVE']),
    update() {
      this.form.post('brand-listing')
          .then(() => {
            this.$notification['success']({
              message: 'Congratulations',
              description: 'Brand listing successfully.',
              style: {marginTop: '41px'},
            });
            this.$store.dispatch('BRAND_LIST')
          })
    },
    onChange(checked) {
      const {TOP_BRAND_ACTIVE} = this;
      if (checked)
        TOP_BRAND_ACTIVE({active: 1})
      else
        TOP_BRAND_ACTIVE({active: 2})
    },
  },
  created() {
    if (!this.brandList.length > 0) this.$store.dispatch('BRAND_LIST');
    this.form.brand_list = this.brandListingId;
  },
  computed: {
    ...mapGetters(["brandList", "isTopBrand", "brandListingId"]),
  },
  watch: {
    brandListingId: function (val) {
      this.form.brand_list = val;
    }
  }
}
</script>

<style scoped>

</style>
