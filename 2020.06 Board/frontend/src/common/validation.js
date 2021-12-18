import { extend, localize } from 'vee-validate';
import { required } from 'vee-validate/dist/rules'

extend('required', {
	...required,
	// message: '* This {_field_} field is required' // default Msg: {_field_} is not valid
	//message: i18n.$t('validations.required', values)
  });

extend('max', {
	validate (value, { max }) {
		return value.length <= max;
	},
	params: ['max'],
//	message: (fieldName, max) => {
//		return `* This ${fieldName} field must have no more than ${max.max} characters`;
//	}
});

localize({
	ko: {
		messages: {
			required: '* {_field_} 항목은 필수 항목입니다.',
			// required: '* 해당 항목은 필수 항목입니다.',
			max:  (fieldName, max) => `* 해당 항목은 ${max.max}자 이하로 작성해주셔야 합니다.`
			// max:  (fieldName, max) => `* ${fieldName} 항목은 ${max.max}자 이하로 작성해주셔야 합니다.`
		}
	},
	en: {
		messages: {
			required: '* This {_field_} field is required',
			// required: '* This field is required',
			max:  (fieldName, max) => `* This field must have no more than ${max.max} characters`
			// max:  (fieldName, max) => `* This ${fieldName} field must have no more than ${max.max} characters`
		}
	}
  });




/*
import VueI18n from 'vue-i18n';
import { localize } from 'vee-validate';
import en from 'vee-validate/dist/locale/en.json';
import ko from 'vee-validate/dist/locale/ko.json';
import zh_CN from 'vee-validate/dist/locale/zh_CN.json';
import ja from 'vee-validate/dist/locale/ja.json';

localize({
	en,
	ko,
	zh_CN,
	ja
  });


 function loadLocale(code) {
	return import(`vee-validate/dist/locale/${code}.json`).then(locale => {
	  localize(code, locale);
	});
  }

  const i18n = new VueI18n({
	locale: 'en',
	en: {
	  validations: validationMessages
	}
  });
  */