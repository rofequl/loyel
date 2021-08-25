<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <span class="text-uppercase page-subtitle">Product
        </span>
        <h3 class="page-title">Attribute</h3>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Attribute Update -->
    <b-card>
      <div class="card" style="background-color: #dae2ed;">
        <a-spin :spinning="spinning" tip="Loading..." size="large">
          <div class="card-body" style="padding: 12px">
            <c-row>
              <c-col>
                <b-form-select v-model="form.category_id" :options="categoryList" value-field="id"
                               text-field="name" @input="categorySelect" :select-size="18"
                               class="cat-select-design"></b-form-select>
              </c-col>
              <c-col>
                <b-form-select v-if="subcategory.length > 0" v-model="form.subcategory_id" :options="subcategory"
                               :select-size="18" value-field="id" @input="subcategorySelect"
                               text-field="name" class="cat-select-design"></b-form-select>
              </c-col>
              <c-col>
                <b-form-select v-if="subsubcategory.length > 0" v-model="form.sub_subcategory_id"
                               :options="subsubcategory" @input="subsubcategorySelect"
                               :select-size="18" value-field="id"
                               text-field="name" class="cat-select-design"></b-form-select>
              </c-col>
            </c-row>
          </div>
        </a-spin>
        <div class="card-footer" style="font-size: 13px">
          Categories Selected:
          {{ catNameShow(form.category_id, 'category') }} {{ catNameShow(form.sub_category_id, 'subcategory') }}
          {{ catNameShow(form.sub_subcategory_id, 'sub-subcategory') }}
          <a-icon v-if="cat_valid"
                  class="text-success" style="font-size: 15px" type="check-circle"/>
        </div>
      </div>

      <c-row v-if="cat_valid">
        <c-col md="12">
          <p class="text-right text-info font-weight-bold my-0" style="font-size: 12px;cursor: pointer"
             @click="$refs.child.modal()">
            + ADD MORE ATTRIBUTE</p>
          <table class="table table-bordered">
            <tr v-for="(volume, k) in attributeById({position: form.cat_position, id: catValue})" :key="k">
              <td>
                <a-tag color="#108ee9">{{ volume.name }}</a-tag>
              </td>
              <td>
                <a-tag v-for="(value, i) in volume.value" :key="i">{{ value }}</a-tag>
              </td>
              <td>
                <a-button-group>
                  <a-button @click="$refs.child.modal(volume)" icon="edit"/>
                  <a-popconfirm placement="topRight"
                                title="Are you sure delete this attribute?"
                                ok-text="Yes"
                                cancel-text="No"
                                @confirm="confirm(volume.id)">
                    <a-button icon="delete"/>
                  </a-popconfirm>
                </a-button-group>
              </td>
            </tr>
          </table>
        </c-col>
      </c-row>
    </b-card>
    <!-- Attribute Update -->
    <!-- Modal -->
    <AttributeAdd ref="child" :position="form.cat_position" :catValue="catValue"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import AttributeAdd from "@/components/product/AttributeAdd";
import ApiService from "@/core/services/api.service";

export default {
  name: "Attribute",
  components: {AttributeAdd},
  data() {
    return {
      spinning: false,
      loadingData: true,
      cat_valid: false,
      catValue: '',
      form: {
        category_id: '',
        subcategory_id: '',
        sub_subcategory_id: '',
        cat_position: 1,
      },
      attribute: [],
      subcategory: [],
      subsubcategory: [],
    }
  },
  methods: {
    categorySelect: function (e) {
      if (e !== '' && e !== undefined) {
        this.form.cat_position = 1;
        this.form.subcategory_id = '';
        this.form.sub_subcategory_id = '';
        this.subcategory = [];
        this.subsubcategory = [];
        this.subcategory = this.subcategoryById(e);
        this.catValue = e;
        this.cat_valid = !this.subcategory.length > 0
        this.loadingData = !this.loadingData;
      }
    },
    subcategorySelect: function (e) {
      if (e !== '' && e !== undefined) {
        this.form.cat_position = 2;
        this.form.sub_subcategory_id = '';
        this.subsubcategory = [];
        this.subsubcategory = this.subsubcategoryById(e);
        this.catValue = e;
        this.cat_valid = !this.subsubcategory.length > 0
        this.loadingData = !this.loadingData;
      }
    },
    subsubcategorySelect: function (e) {
      if (e !== '' && e !== undefined) {
        this.form.cat_position = 3;
        this.catValue = e;
        this.cat_valid = e !== ''
        this.loadingData = !this.loadingData;
      }
    },
    catNameShow(id, type) {
      if (type === 'category' && id !== '') {
        let data = this.categoryNameById(id)
        return data ? data.name : '';
      }

      if (type === 'subcategory' && id !== '') {
        let data = this.subcategoryNameById(id)
        return data ? '>>' + data.name : '';
      }

      if (type === 'sub-subcategory' && id !== '') {
        let data = this.subsubcategoryNameById(id)
        return data ? '>>' + data.name : '';
      }
    },
    confirm(id) {
      ApiService.delete('attribute/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('ATTRIBUTE_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Attribute delete successfully.',
                style: {marginTop: '41px'},
              });
            }
          })
          .catch(err => {
            this.$notification['error']({
              message: 'Warning',
              description: ((err.response || {}).data || {}).message || 'Something Wrong',
              style: {marginTop: '41px'},
              duration: 4
            })
          })
    },
  },
  async created() {
    this.spinning = true;
    if (!this.categoryList.length > 0) this.$store.dispatch('CATEGORY_LIST');
    if (!this.subcategoryList.length > 0) this.$store.dispatch('SUBCATEGORY_LIST');
    if (!this.subsubcategoryList.length > 0) this.$store.dispatch('SUBSUBCATEGORY_LIST');
    if (!this.attributeList.length > 0) await this.$store.dispatch('ATTRIBUTE_LIST');
    this.spinning = false;

  },
  computed: {
    ...mapGetters(["categoryList", "subcategoryList", "subsubcategoryList", "subcategoryById", "categoryNameById", "subcategoryNameById", "subsubcategoryNameById",
      "subsubcategoryById", "attributeList", "attributeById"]),
  }
}
</script>

<style scoped>

</style>
