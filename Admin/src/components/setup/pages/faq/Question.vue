<template>
  <div>
    <!-- Page Header -->
    <div class="row">
      <div class="col-12 col-sm-6 text-center text-sm-left mb-4 mb-sm-0">
        <h3 class="page-title">Question</h3>
      </div>
      <div class="col-12 col-sm-6 d-flex align-items-center">
        <div class="mx-auto ml-sm-auto mr-sm-0">
          <CButton @click="$refs.child.modal()" block size="sm" color="info">Add New Question</CButton>
        </div>
      </div>
    </div>
    <!-- End Page Header -->
    <!-- Datatable -->
    <div id="people" class="dataTables_wrapper no-footer my-5">
      <v-client-table :data="questionList" :columns="columns" :options="options" class="text-center"
                      ref="table">
        <div slot="serial" slot-scope="props">
          {{ questionIndex(props.row.id) }}
        </div>
        <div slot="top" slot-scope="props">
          <a-switch checked-children="Yes" un-checked-children="No"
                    :checked="props.row.status === 1" @change="value => onChange(value, props.row.id)"/>
        </div>
        <div slot="action" slot-scope="props">
          <a-button-group>
            <a-button @click="$refs.child.modal(props.row)" icon="edit"/>
            <a-popconfirm placement="topRight"
                          title="Are you sure delete this question?"
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
    <question-add ref="child"/>
    <!-- End Modal -->
  </div>
</template>

<script>
import QuestionAdd from "@/components/setup/pages/faq/QuestionAdd";
import ApiService from "@/core/services/api.service";
import {mapActions, mapGetters} from "vuex";

export default {
  name: "Question",
  components: {QuestionAdd},
  created() {
    if (!this.questionList.length > 0) this.$store.dispatch('FAQ_LIST');
  },
  methods: {
    ...mapActions(['TOP_QUESTION']),
    onChange(checked, id) {
      const {TOP_QUESTION} = this;
      if (checked)
        TOP_QUESTION({active: 1, id: id})
      else
        TOP_QUESTION({active: 0, id: id})
    },
    confirm(id) {
      ApiService.delete('question/' + id)
          .then((data) => {
            if (data.data.result === 'Error') {
              this.$notification['error']({
                message: 'Warning',
                description: data.data.message,
                style: {marginTop: '41px'},
              });
            } else {
              this.$store.commit('QUESTION_REMOVE', id);
              this.$notification['success']({
                message: 'Congratulations',
                description: 'Question delete successfully.',
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
    ...mapGetters(["questionList", "questionIndex"]),
    columns() {
      return ['serial', 'question', 'top', 'action'];
    },
    options() {
      return {
        headings: {
          serial: '#',
          question: 'Question',
          top: 'Top Question',
        },
        filterable: ['Question']
      }
    }
  }
}
</script>

<style scoped>

</style>
