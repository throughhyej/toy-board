import List from '../views/List.vue'
import Write from '../views/Write'
import Read from '../views/Read'
import Edit from '../views/Edit'
import Nothing from '../views/Nothing'

export default [
	{
		path: '/',
		component: List
	},
	{
		path: '/write',
		component: Write
	},
	{
		path: '/detail/:bno',
		component: Read
	},
	{
		path: '/edit/:bno',
		component: Edit
	},
	{
		path: '/nothing',
		component: Nothing
	}
]