<template>
  <div class="container-fluid p-0">
    <div class="section-wrapper">
      <a-steps progress-dot :current="current" size="small">
        <a-step v-for="item in steps" :key="item.title" :title="item.title" @click="current = item.key - 1"
                style="cursor: pointer"/>
      </a-steps>
      <!-- Part - 1 -->
      <div v-if="steps[current].key === 1" class="py-4">
        <div class="card mt-5" style="background-color: #dae2ed;">
          <div class="card-header bg-white">
            Product category Select
          </div>
          <div class="card-body" style="padding: 12px">
            <a-row :gutter="16">
              <a-col col="12" :md="8" class="mb-2">
                <b-form-select v-model="form.category_id" :options="categoryList" value-field="id"
                               text-field="name" @input="categorySelect" :select-size="18"
                               class="cat-select-design"></b-form-select>
              </a-col>
              <a-col col="12" :md="8" class="mb-2">
                <b-form-select v-if="subcategory.length > 0" v-model="form.subcategory_id" :options="subcategory"
                               :select-size="18" value-field="id" @input="subcategorySelect"
                               text-field="name" class="cat-select-design"></b-form-select>
              </a-col>
              <a-col col="12" :md="8" class="mb-2">
                <b-form-select v-if="subsubcategory.length > 0" v-model="form.sub_subcategory_id"
                               :options="subsubcategory" @input="subsubcategorySelect"
                               :select-size="18" value-field="id"
                               text-field="name" class="cat-select-design"></b-form-select>
              </a-col>
            </a-row>
          </div>
          <div class="card-footer bg-white" style="font-size: 13px">
            Categories Selected:
            {{ catNameShow(form.category_id, 'category') }} {{ catNameShow(form.sub_category_id, 'subcategory') }}
            {{ catNameShow(form.sub_subcategory_id, 'sub-subcategory') }}
            <a-icon v-if="cat_valid"
                    class="text-success" style="font-size: 15px" type="check-circle"/>
          </div>
        </div>
        <a-row :gutter="16" class="my-4">
          <a-col :md="12">
            <a-card>
              <a-form-model-item class="mb-0" label="Product Name *: ">
                <a-input v-model="form.name" placeholder="Enter product name..."/>
              </a-form-model-item>
              <a-form-model-item class="mb-0" label="Product Brand:">
                <a-input-group compact>
                  <a-select show-search placeholder="Select Brand" style="width: 100%"
                            option-filter-prop="children" :filter-option="filterBrandOption" v-model="form.brand_id">
                    <a-select-option v-for="brand in brandList" :key="brand.id" :value="brand.id" :label="brand.name">
                      <span role="img" :aria-label="brand.name">
                      <img :src="showImage(brand.logo)" class="mx-2" width="18px" height="18px" alt="Category">
                      </span>
                      {{ brand.name }}
                    </a-select-option>
                  </a-select>
                </a-input-group>
              </a-form-model-item>
              <a-form-model-item label="Product Unit:">
                <a-input-group compact>
                  <a-select show-search placeholder="Select Unit" style="width: 100%"
                            option-filter-prop="children" :filter-option="filterOption" v-model="form.unit_id">
                    <a-select-option v-for="unit in unitList" :key="unit.id" :value="unit.id" :label="unit.name">
                      {{ unit.name }}
                    </a-select-option>
                  </a-select>
                </a-input-group>
              </a-form-model-item>
              <a-form-model-item :label-col="{lg: {span: 5}, sm: {span: 7}}"
                                 :wrapper-col="{lg: {span: 17}, sm: {span: 17}}" label="Refundable">
                <a-switch checked-children="Yes" un-checked-children="No" v-model="form.Refundable"/>
              </a-form-model-item>
            </a-card>
          </a-col>
          <a-col :md="12">
            <a-card>
              <a-form-model-item class="mb-2" label="Product Weight: ">
                <a-input type="number" step="0.01" v-model="form.weight" min="0" suffix="KG"
                         placeholder="Enter product weight..."/>
              </a-form-model-item>
              <label class="mb-2" for="tags-pills">Tags:</label>
              <b-form-tags
                  input-id="tags-pills"
                  v-model="form.tags"
                  tag-pills
                  size="md"
                  separator=" "
                  placeholder="Enter product tags..."
              ></b-form-tags>
              <a-form-model-item class="my-2" label="Product Dimension: ">
                <a-input v-model="form.dimension" placeholder="Height X Width X Length"/>
              </a-form-model-item>
              <a-form-model-item :label-col="{lg: {span: 6}, sm: {span: 7}}"
                                 :wrapper-col="{lg: {span: 18}, sm: {span: 17}}" label="Product Type: ">
                <a-radio-group name="radioGroup" v-model="form.product_type">
                  <a-radio :value="1">New</a-radio>
                  <a-radio :value="2">Used</a-radio>
                </a-radio-group>
              </a-form-model-item>
            </a-card>
          </a-col>
        </a-row>
        <a-row class="my-4">
          <a-col>
            <a-card>
              <template slot="title">
                <h6>Product Attributes
                  <a-tooltip placement="topRight">
                    <template slot="title" v-if="!cat_valid">
                      <span>To active this button please select the category first.</span>
                    </template>
                    <a-switch class="float-right" checked-children="Yes" un-checked-children="No"
                              v-model="form.attribute" :disabled="!cat_valid" @change="variation"/>
                  </a-tooltip>
                </h6>
                <div class="clearfix"></div>
                <p style="font-size: 12px; color: #9b9494">Boost your item's searchability by filling-up the Key Product
                  Information marked with KEY. The more you fill-up, the easier for buyers to find your product.</p>
              </template>
              <div v-if="form.attribute">
                <a-form-model-item :label-col="{lg: {span: 4}, sm: {span: 7}}"
                                   v-for="(attribute,k) in form.attribute_option"
                                   :wrapper-col="{lg: {span: 20}, sm: {span: 17}}" :label="attribute.label" :key="k">
                  <a-input-group compact>
                    <a-select mode="tags" show-search placeholder="Select Unit" style="width: 100%" @change="variation"
                              option-filter-prop="children" :filter-option="filterOption" v-model="attribute.value">
                      <a-select-option v-for="(attributeData,f) in attribute.data" :key="k+'-'+f"
                                       :value="attributeData">
                        {{ attributeData }}
                      </a-select-option>
                    </a-select>
                  </a-input-group>
                </a-form-model-item>
              </div>
            </a-card>
          </a-col>
        </a-row>
      </div>
      <!-- End Part - 1 -->
      <!-- Part - 2 -->
      <div v-if="steps[current].key === 2" class="py-4">
        <a-card>
          <template slot="title">
            <h6>Product Photos *</h6>
            <span style="font-size: 12px; color: #9b9494">You can upload multiple product image in here</span>
          </template>
          <ImagesUpload v-model="form.photos"/>
        </a-card>
        <a-row :gutter="16" class="my-4">
          <a-col :md="12">
            <a-card title="Product Video Url :">
              <a-input ref="userNameInput" v-model="form.video_link" placeholder="https://youtu.be/OEFkHHK0o8s">
                <a-tooltip slot="suffix" title="You can just input Youtube / Vimeo / DailyMotion video url">
                  <a-icon type="info-circle" style="color: rgba(0,0,0,.45)"/>
                </a-tooltip>
              </a-input>
            </a-card>
          </a-col>
          <a-col :md="12">
            <a-card title="Product Thumbnail Image *">
              <ImageUpload v-model="form.thumbnail_img"/>
            </a-card>
          </a-col>
        </a-row>
        <a-card class="mb-4">
          <template slot="title">
            <h6>Product Color :
              <a-tooltip placement="topRight">
                <template slot="title">
                  <span>To active this switch you can upload image with color.</span>
                </template>
                <a-switch class="float-right" checked-children="Yes" un-checked-children="No"
                          v-model="form.color_image"/>
              </a-tooltip>
            </h6>
            <span style="font-size: 12px; color: #9b9494">If your product has multiple colour, you can select all the color and also you can upload image with color..</span>
          </template>
          <a-input-group compact>
            <a-select mode="multiple" show-search placeholder="Select Color" style="width: 100%"
                      v-model="colorValue" @change="colorImage">
              <a-select-option v-for="color in colorList" :key="color.id" :value="color.name">
                {{ color.name }}
              </a-select-option>
            </a-select>
          </a-input-group>
          <div class="mt-3 d-flex" v-if="form.color_image">
            <ImagesUpload v-for="(image, k) in form.color" :key="k" :multiple="false" :title="image.name"
                          v-model="image.image"/>
          </div>
        </a-card>
        <a-card title="Product Description :">
          <vue-editor v-model="form.description"/>
        </a-card>
      </div>
      <!-- End Part - 2 -->
      <!-- Part - 3 -->
      <div v-if="steps[current].key === 3" class="py-4">
        <a-card class="mb-4">
          <template slot="title">
            <h6>Product Order Quantity Limitation :
              <a-tooltip placement="topRight">
                <template slot="title">
                  <span>To active this switch you can manage quantity limitation.</span>
                </template>
                <a-switch class="float-right" checked-children="Yes" un-checked-children="No"
                          v-model="form.qty_manage"/>
              </a-tooltip>
            </h6>
            <span style="font-size: 12px; color: #9b9494">You can manage minimum and maximum quantity limitation.</span>
          </template>
          <a-row v-if="form.qty_manage" :gutter="16">
            <a-col :md="12">
              <a-form-model-item class="mb-0" label="Product minimum order quantity : ">
                <a-input-number style="width: 100%" v-model="form.min_qty" :min="1"/>
              </a-form-model-item>
            </a-col>
            <a-col :md="12">
              <a-form-model-item class="mb-0" label="Product maximum order quantity : ">
                <a-input-number style="width: 100%" v-model="form.max_qty" :min="1"/>
              </a-form-model-item>
            </a-col>
          </a-row>
        </a-card>
        <a-card title="Product price and stock :" class="mb-4">
          <a-form-model-item :label-col="{lg: {span: 4}, sm: {span: 7}}" labelAlign="left"
                             :wrapper-col="{lg: {span: 20}, sm: {span: 17}}" label="Price Type: ">
            <a-radio-group name="radioGroup" v-model="form.price_type">
              <a-radio :value="1">Simple Product</a-radio>
              <a-radio :value="2">Variable Product</a-radio>
              <a-radio :value="3">Volume tier Pricing</a-radio>
            </a-radio-group>
          </a-form-model-item>
          <a-checkbox @change="stockManage" :checked="form.stock_manage === 2">
            Stock management
          </a-checkbox>
          <div v-if="form.price_type === 1">
            <a-row class="my-4" v-if="form.stock_manage === 2">
              <a-col :md="12">
                <a-form-model-item class="mb-0" :label-col="{lg: {span: 7}, sm: {span: 7}}" labelAlign="left"
                                   :wrapper-col="{lg: {span: 17}, sm: {span: 17}}" label="Quantity : ">
                  <a-input-number style="width: 100%" v-model="form.quantity" :min="0"/>
                </a-form-model-item>
              </a-col>
            </a-row>
            <a-row class="my-4">
              <a-col :md="12">
                <a-form-model-item class="mb-0" :label-col="{lg: {span: 7}, sm: {span: 7}}" labelAlign="left"
                                   :wrapper-col="{lg: {span: 17}, sm: {span: 17}}" label="Price : ">
                  <a-input-number step=".02" :formatter="value => `৳ ${value}`"
                                  :parser="value => value.replace('৳', '')" style="width: 100%" v-model="form.price"
                                  :min="1"/>
                </a-form-model-item>
              </a-col>
            </a-row>
          </div>
          <div v-if="form.price_type === 2">
            <!-- Table -->
            <table class="table table-bordered my-4">
              <a-empty v-if="form.price_option.length === 0"/>
              <tbody v-else>
              <tr v-for="(volume, f) in form.price_option" :key="f">
                <td>
                  <a-tag v-for="(tag, k) in volume.variant" :key="k">{{ tag }}</a-tag>
                </td>
                <td>
                  <a-input-number step=".02" :formatter="value => `৳ ${value}`"
                                  :parser="value => value.replace('৳', '')" style="width: 100%"
                                  v-model="volume.variant_price"
                                  :min="1"/>
                </td>
                <td>
                  <a-input-number :disabled="form.stock_manage === 1" style="width: 100%" v-model="volume.quantity"
                                  :min="0"/>
                </td>
              </tr>
              </tbody>
            </table>
            <!-- End Table -->
          </div>
          <div v-if="form.price_type === 3">
            <CRow class="my-4" v-if="form.stock_manage === 2">
              <CCol md="6">
                <a-form-model-item class="mb-0" :label-col="{lg: {span: 7}, sm: {span: 7}}" labelAlign="left"
                                   :wrapper-col="{lg: {span: 17}, sm: {span: 17}}" label="Quantity : ">
                  <a-input-number style="width: 100%" v-model="form.quantity" :min="0"/>
                </a-form-model-item>
              </CCol>
            </CRow>
            <p class="text-right text-info font-weight-bold mt-4 mb-0" style="font-size: 12px;cursor: pointer"
               @click="addTierPrice">
              + ADD VOLUME TIER</p>
            <!-- Table -->
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>Minimum Quantity</th>
                <th>Maximum Quantity</th>
                <th>Unit Price</th>
                <th>Action</th>
              </tr>
              </thead>

              <tbody>
              <tr v-if="form.tier_price.length === 0">
                <td colspan="4">
                  <a-empty/>
                </td>
              </tr>
              <tr v-for="(volume, f) in form.tier_price" :key="f">
                <td>
                  <a-input-number style="width: 100%" v-model="volume.min_unit" :min="1"/>
                </td>
                <td>
                  <a-input-number style="width: 100%" v-model="volume.max_unit" :min="1"/>
                </td>
                <td>
                  <a-input-number step=".02" :formatter="value => `৳ ${value}`"
                                  :parser="value => value.replace('৳', '')" style="width: 100%" v-model="volume.value"
                                  :min="1"/>
                </td>
                <td>
                  <a-button type="primary" @click="removeTierPrice(f, volume)" icon="delete"/>
                </td>
              </tr>
              </tbody>
            </table>
            <!-- End Table -->
          </div>
        </a-card>
        <a-card>
          <template slot="title">
            <h6>Product Discount :
              <a-tooltip placement="topRight">
                <template slot="title">
                  <span>To active this switch you can set the discount rate.</span>
                </template>
                <a-switch class="float-right" checked-children="Yes" un-checked-children="No"
                          v-model="form.discount"/>
              </a-tooltip>
            </h6>
            <span style="font-size: 12px; color: #9b9494">You can set fixed discount and variation discount.</span>
          </template>
          <div v-if="form.discount">
            <a-form-model-item v-if="form.discount_method === 1" class="mb-0"
                               :label-col="{lg: {span: 3}, sm: {span: 7}}"
                               labelAlign="left"
                               :wrapper-col="{lg: {span: 15}, sm: {span: 17}}" label="Discount : ">
              <a-input-group compact>
                <a-input-number step=".2" style="width: 80%" v-model="form.discount_value" :min="1"/>
                <a-select v-model="form.discount_type" style="width: 20%">
                  <a-select-option value="Percent">
                    Percent
                  </a-select-option>
                  <a-select-option value="Flat">
                    Flat
                  </a-select-option>
                </a-select>
              </a-input-group>
            </a-form-model-item>
            <a-checkbox @change="discountManage" class="my-4" :checked="form.discount_method === 2">
              Enable volume tier Discount
            </a-checkbox>
            <a-row v-if="form.discount_method == 2" class="my-4">
              <a-col :col="24" :sm="24" :md="16" class="mb-3 mb-xl-0">
                <p class="text-right text-info font-weight-bold my-0" style="font-size: 12px;cursor: pointer"
                   @click="addTierDiscount">
                  + ADD VOLUME TIER</p>
                <table class="table table-bordered">
                  <thead>
                  <tr>
                    <th>Minimum Quantity</th>
                    <th></th>
                    <th>Additional % off</th>
                    <th>Action</th>
                  </tr>
                  </thead>

                  <tbody>
                  <tr v-if="form.tier_discount.length === 0">
                    <td colspan="4">
                      <a-empty/>
                    </td>
                  </tr>
                  <tr v-for="(volume, f) in form.tier_discount" :key="f">
                    <td>
                      <a-input-number style="width: 100%" v-model="volume.unit" :min="1"/>
                    </td>
                    <td>
                      or more
                    </td>
                    <td>
                      <a-input type="number" suffix="%" step="1" style="width: 100%" v-model="volume.value"
                               :min="1"/>
                    </td>
                    <td>
                      <a-button type="primary" @click="removeTierDiscount(f, volume)" icon="delete"/>
                    </td>
                  </tr>
                  </tbody>
                </table>

              </a-col>
            </a-row>
          </div>
        </a-card>
      </div>
      <!-- End Part - 3 -->
      <!-- Part - 4 -->
      <div v-if="steps[current].key === 4" class="py-4">
        <a-row class="my-4" :gutter="16">
          <a-col :md="12">
            <a-card class="p-4">
              <a-form-model-item label="Warranty Type : " :label-col="{lg: {span: 7}, sm: {span: 7}}" labelAlign="left"
                                 :wrapper-col="{lg: {span: 17}, sm: {span: 17}}">
                <a-select style="width: 100%" v-model="form.warranty_type">
                  <a-select-option :value="0">
                    No Warranty
                  </a-select-option>
                  <a-select-option :value="1">
                    International Manufacturer Warranty
                  </a-select-option>
                  <a-select-option :value="2">
                    Non-local warranty
                  </a-select-option>
                  <a-select-option :value="3">
                    Local seller warranty
                  </a-select-option>
                  <a-select-option :value="4">
                    International seller warranty
                  </a-select-option>
                </a-select>
              </a-form-model-item>
              <a-form-model-item class="mb-0" label="Warranty Period : " :label-col="{lg: {span: 7}, sm: {span: 7}}"
                                 labelAlign="left"
                                 :wrapper-col="{lg: {span: 17}, sm: {span: 17}}">
                <a-input v-model="form.warranty_period" placeholder="Warranty Period Ex-(1 Month)"/>
              </a-form-model-item>
            </a-card>
          </a-col>
          <a-col :md="12">
            <a-card class="p-4">
              <a-form-model-item :label-col="{lg: {span: 7}, sm: {span: 7}}" labelAlign="left"
                                 :wrapper-col="{lg: {span: 17}, sm: {span: 17}}" label="Free Shipping">
                <a-switch checked-children="Yes" un-checked-children="No" v-model="form.shipping"/>
              </a-form-model-item>
              <a-form-model-item class="mb-0" :label-col="{lg: {span: 7}, sm: {span: 7}}" labelAlign="left"
                                 :wrapper-col="{lg: {span: 17}, sm: {span: 17}}" label="Shipping cost : ">
                <a-input-number step=".02" :formatter="value => `৳ ${value}`" :disabled="form.shipping"
                                :parser="value => value.replace('৳', '')" style="width: 100%"
                                v-model="form.shipping_cost"
                                :min="1"/>
              </a-form-model-item>
            </a-card>
          </a-col>
        </a-row>
      </div>
      <!-- End Part - 4 -->
      <div class="steps-action mt-0 mb-5 w-100">
        <a-button class="float-right"
                  v-if="current == steps.length - 1"
                  type="primary"
                  @click="checkSubmit"
        >
          Submit Product
        </a-button>
        <a-button v-if="current > 0" class="float-left" @click="prev">
          Previous
        </a-button>
        <a-button class="ml-3 float-right" v-if="current < steps.length - 1" type="primary" @click="next">
          Next
        </a-button>
      </div>
      <div class="clearfix mb-5"></div>
    </div>
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import ImagesUpload from "@/components/helper/ImagesUpload";
import ImageUpload from "@/components/helper/ImageUpload";

export default {
  name: "ProductCreate",
  components: {ImageUpload, ImagesUpload},
  data() {
    return {
      current: 0,
      steps: [
        {
          title: 'Product Information',
          key: 1,
        },
        {
          title: 'Product Description',
          key: 2,
        },
        {
          title: 'Price & Stock',
          key: 3,
        },
        {
          title: 'Service & Delivery',
          key: 4,
        },
      ],
      loadingCategory: false,
      cat_valid: false,
      catValue: 1,
      form: new Form({
        category_id: '',
        subcategory_id: '',
        sub_subcategory_id: '',
        cat_position: 1,
        name: '',
        added_by: 'seller',
        brand_id: undefined,
        unit_id: undefined,
        Refundable: false,
        weight: '',
        tags: [],
        dimension: '',
        product_type: 1,
        attribute: false,
        attribute_option: [],
        photos: [],
        thumbnail_img: '',
        video_link: '',
        description: '',
        color_image: false,
        color: [],
        qty_manage: false,
        min_qty: 1,
        max_qty: 1,
        price_type: 1,
        stock_manage: 2, //1=korbe na 2=korbe
        quantity: 1,
        price: 0,
        price_option: [],
        tier_price: [],
        discount: false,
        discount_value: 1,
        discount_type: 'Percent',
        discount_method: 1,
        tier_discount: [],
        warranty_type: 0,
        warranty_period: '',
        shipping: false,
        shipping_cost: 0,
      }),
      subcategory: [],
      subsubcategory: [],
      colorValue: [],
      description: '',
    }
  },
  methods: {
    next() {
      this.current++;
    },
    prev() {
      this.current--;
    },
    filterOption(input, option) {
      return (
          option.componentOptions.children[0].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
    filterBrandOption(input, option) {
      return (
          option.componentOptions.children[1].text.toLowerCase().indexOf(input.toLowerCase()) >= 0
      );
    },
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
        this.loadingCategory = !this.loadingCategory;
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
        this.loadingCategory = !this.loadingCategory;
      }
    },
    subsubcategorySelect: function (e) {
      if (e !== '' && e !== undefined) {
        this.form.cat_position = 3;
        this.catValue = e;
        this.cat_valid = e !== ''
        this.loadingCategory = !this.loadingCategory;
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
    loadAttribute() {
      this.form.attribute_option = [];
      let attribute = this.attributeById({position: this.form.cat_position, id: this.catValue});
      for (let i = 0; i < attribute.length; i++) {
        this.form.attribute_option.unshift({
          label: attribute[i].name,
          data: attribute[i].value,
          value: [],
        });
      }
    },
    colorImage() {
      this.form.color = [];
      let color = this.colorValue;
      for (let prop in color) {
        this.form.color.push({
          name: color[prop],
          image: '',
        })
      }
      this.variation();
    },
    stockManage(e) {
      if (e.target.checked) this.form.stock_manage = 2
      else this.form.stock_manage = 1;
    },
    discountManage(e) {
      if (e.target.checked) this.form.discount_method = 2
      else this.form.discount_method = 1;
    },
    variation() {
      let data = [];
      if (this.form.color.length > 0) data.push(this.form.color.map(value => value.name));
      if (this.form.attribute) {
        for (let prop in this.form.attribute_option) {
          if (this.form.attribute_option[prop].value.length > 0) {
            let value = [];
            for (let id in this.form.attribute_option[prop].value) {
              value.push(this.form.attribute_option[prop].value[id]);
            }
            data.push(value);
          }
        }
      }
      let result = [];
      let finalResult = [];
      if (data.length > 0) {
        result = this.getCombination(data);
      }
      if (result.length > 0) {
        for (var original_result of result) {
          var makeArray = original_result.split(",");
          var arrFiltered = makeArray.filter(el => {
            return el != null && el != '';
          });
          finalResult.push({
            'variant': arrFiltered,
            'variant_price': this.form.price,
            'quantity': this.form.quantity,
          })
        }
      }
      this.form.price_option = finalResult;
    },
    getCombination(data) {
      let result = [];
      data.forEach(function (item, index) {
        if (index === 0) {
          for (let color of item) {
            result.push(color);
          }
        } else {
          let tmp = [];
          for (let k = 0; k < result.length; k++) {
            for (let color of item) {
              let newArray = [];
              newArray[index] = color;
              tmp.push(result[k].concat(newArray));
            }
          }
          result = tmp;
        }
      });
      return result;
    },
    addTierPrice() {
      this.form.tier_price.push({
        min_unit: 1,
        max_unit: 1,
        value: 1,
      })
    },
    removeTierPrice(index, invoice_product) {
      let idx = this.form.tier_price.indexOf(invoice_product);
      if (idx > -1) {
        this.form.tier_price.splice(idx, 1);
      }
    },
    addTierDiscount() {
      this.form.tier_discount.push({
        unit: 1,
        value: 1,
      })
    },
    removeTierDiscount(index, invoice_product) {
      let idx = this.form.tier_discount.indexOf(invoice_product);
      if (idx > -1) {
        this.form.tier_discount.splice(idx, 1);
      }
    },
    checkSubmit() {
      let error = false;
      let data = '';
      if (!this.cat_valid) {
        data += 'Select the category, '
        error = true
      }
      
      if (this.form.name === '') {
        data += 'Enter the product name, ';
        error = true
      }
      if (this.form.photos.length === 0) {
        data += 'Upload multiple image, ';
        error = true
      }
      if (this.form.thumbnail_img === '') {
        data += 'Upload thumbnail image, ';
        error = true
      }
      if (error) {
        this.$warning({
          zIndex: 1030,
          centered: true,
          title: 'You can\'t upload this product',
          content: data,
        });
      } else {
        let that = this;
        this.$confirm({
          zIndex: 1030,
          centered: true,
          title: 'Do you want to upload this product?',
          content: 'When clicked the OK button, this product has been uploaded.',
          onOk() {
            return new Promise((resolve, reject) => {
              that.form.post('product')
                  .then(({data}) => {
                    that.$store.commit('PRODUCT_ADD', data);
                    resolve(data);
                  })
                  .catch(err => {
                    reject(err);
                  })
            }).then(() => {
              that.$notification['success']({
                message: 'congratulations',
                description: 'Product upload successfully.',
                style: {marginTop: '41px'},
              });
              that.$router.push('/seller/product-list')
            }).catch(() => {
              that.$notification['error']({
                message: 'Warning',
                description: 'Product is not uploaded',
                style: {
                  marginTop: '41px'
                },
                duration: 5
              })
            });
          },
        });
      }
    },
  },
  created() {
    if (!this.categoryList.length > 0) this.$store.dispatch('CATEGORY_LIST');
    if (!this.subcategoryList.length > 0) this.$store.dispatch('SUBCATEGORY_LIST');
    if (!this.subsubcategoryList.length > 0) this.$store.dispatch('SUBSUBCATEGORY_LIST');
    if (!this.brandList.length > 0) this.$store.dispatch('BRAND_LIST');
    if (!this.unitList.length > 0) this.$store.dispatch('UNIT_LIST');
    if (!this.attributeList.length > 0) this.$store.dispatch('ATTRIBUTE_LIST');
    if (!this.colorList.length > 0) this.$store.dispatch('COLOR_LIST');
  },
  watch: {
    cat_valid: function (e) {
      if (!e) this.form.attribute = false;
    },
    loadingCategory: function () {
      if (this.cat_valid) this.loadAttribute();
    },
    attributeList: {
      deep: true,
      handler() {
        if (this.cat_valid) this.loadAttribute();
      }
    },

  },
  computed: {
    ...mapGetters(["categoryList", "subcategoryList", "subsubcategoryList", "subcategoryById", "categoryNameById", "subcategoryNameById", "subsubcategoryNameById",
      "subsubcategoryById", "attributeById", "attributeList", "brandList", "unitList", "colorList"]),
  }
}
</script>

<style scoped>
.steps-content {
  margin-top: 16px;
  border: 1px dashed #e9e9e9;
  border-radius: 6px;
  background-color: #fafafa;
  min-height: 200px;
  text-align: center;
  padding-top: 80px;
}

.steps-action {
  margin-top: 24px;
}
</style>
