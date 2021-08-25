<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <h3 class="page-title">Question Subcategory</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Question Subcategory</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="questionSubcategoryList" :columns="columns" :options="options" class="text-center"
                      ref="table">
        <div slot="serial" slot-scope="props">
          {{ questionSubcategoryIndex(props.row.id) }}
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this question subcategory?"
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
    <help-subcategory-add ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import ApiService from "@/core/services/api.service";
import {mapGetters} from "vuex";
import HelpSubcategoryAdd from "@/components/setup/pages/faq/HelpSubcategoryAdd";

export default {
  name: "HelpSubcategory",
  components: {HelpSubcategoryAdd},
  created() {
    if (!this.questionSubcategoryList.length > 0) this.$store.dispatch('FAQ_LIST');
  },
  methods: {
    confirm(id) {
      ApiService.delete('question-subcategory/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('QUESTION_SUBCATEGORY_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Question subcategory delete successfully.',
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
    ...mapGetters(["questionSubcategoryList", "questionSubcategoryIndex"]),
    columns() {
      return ['serial', 'category', 'name', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          category: 'Question Category Name',
          name: 'Question Subcategory Name',
        },
        filterable: ['name']
      }
    }
  }
}
</script>

<style scoped>

</style>
