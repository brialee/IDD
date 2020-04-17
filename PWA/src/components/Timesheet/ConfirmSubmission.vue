<template>
  <v-row>
    <v-btn
      color="success"
      dark
      @click.stop="dialog = true"
    >
      Submit
    </v-btn>

    <v-dialog
      v-model="dialog"
      max-width="290"
    >
      <v-card>
        <v-card-title class="headline">Are you sure you want to submit the form?</v-card-title>

        <v-card-text>
					Some text talking about how this submission is final unless something is wrong
					with it.
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn
            color="red"
            text
            @click="dialog = false"
          >
						Cancel
          </v-btn>

          <v-btn
            color="green darken-1"
            text
            @click="dialog = false"
          >
            Submit
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
  export default {
		name: "ConfirmSubmission",
		props: {
			isValide: Boolean
		},
    data () {
      return {
        dialog: false,
      }
    },
  }
</script>
