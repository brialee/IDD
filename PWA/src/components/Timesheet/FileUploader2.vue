<template>
	<div>
  <v-file-input
    v-model="files"
    color="primary"
    counter
    label="File input"
		accept="image/*"
    multiple
    placeholder="Select your files"
    prepend-icon="mdi-paperclip"
    outlined
    :show-size="1000"
  >
    <template v-slot:selection="{ index, text }">
      <v-chip
        v-if="index < 2"
        color="success"
        dark
        label
        small
      >
        {{ text }}
      </v-chip>

      <span
        v-else-if="index === 2"
        class="overline grey--text text--darken-3 mx-2"
      >
        +{{ files.length - 2 }} File(s)
      </span>
    </template>
  </v-file-input>
  <v-btn
      :loading="loading"
      :disabled="loading"
      color="blue-grey"
      class="ma-2 white--text"
      @click="upload"
    >
      Upload
      <v-icon right dark>mdi-cloud-upload</v-icon>
    </v-btn>
</div>
</template>

<style>
  .custom-loader {
    animation: loader 1s infinite;
    display: flex;
  }
  @-moz-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-webkit-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @-o-keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
  @keyframes loader {
    from {
      transform: rotate(0);
    }
    to {
      transform: rotate(360deg);
    }
  }
</style>

<script>
import axios from 'axios'

  export default {
    data: () => ({
			currFiles: [],
			loading: false,
      files: []
    }),
		methods: {
			remove (index) {
				this.files.splice(index, 1)
			},
			upload() {
        console.log(this.files)
				console.log('https://iddappserver.azurewebsites.net/ImageUpload/DocAsForm')
				axios.post('https://iddappserver.azurewebsites.net/ImageUpload/DocAsForm',
					this.files)
			},
			inputChanged() {
				console.log(this.files)
				
				this.files = [
					...this.currFiles,
					...this.files
			]
		}
	}
}
</script>
