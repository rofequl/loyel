<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <h3 class="page-title">Question Category</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Question Category</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->

    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="questionCategoryList" :columns="columns" :options="options" class="text-center"
                      ref="table">
        <div slot="serial" slot-scope="props">
          {{ questionCategoryIndex(props.row.id) }}
        </div>
        <div slot="icon" slot-scope="props">
          <img :src="showImage(props.row.icon)" class="border" width="80px">
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this question category?"
                          ok-text="Yes"
                          cancel-text="No"
                          @confirm="confirm(props.row.id)">
              <a-button icon="delete"/>
            </a-popconfirm>
          </a-button-group>
        </div>
      </v-client-table>
    </div>
    <!-- End Datatable -->
    <!-- Modal -->
    <help-category-add ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import {mapGetters} from "vuex";
import HelpCategoryAdd from "@/components/setup/pages/faq/HelpCategoryAdd";
import ApiService from "@/core/services/api.service";

export default {
  name: "HelpCategory",
  components: {HelpCategoryAdd},
  created() {
    if (!this.questionCategoryList.length > 0) this.$store.dispatch('FAQ_LIST');
  },
  methods: {
    confirm(id) {
      ApiService.delete('question-category/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('QUESTION_CATEGORY_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Question category delete successfully.',
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
  computed: {
    ...mapGetters(["questionCategoryList", "questionCategoryIndex"]),
    columns() {
      return ['serial', 'name', 'icon', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          name: 'Question Category Name',
          icon: 'Question Category Icon',
        },
        filterable: ['name']
      }
    }
  }
}
</script>

<style scoped>

</style>
