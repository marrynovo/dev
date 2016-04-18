import React, {
	ScrollView,
	View,
	Text,
	Image,
	Dimensions,
} from 'react-native';
const { width, height } = Dimensions.get('window');
import { PureButton } from '../components/Form';
import { BackStep } from '../components/View';
class StoryView extends React.Component {
	render() {
		const { uri } = this.props;
		return (
			<View style={{ flex: 1, backgroundColor: '#000000' }}>
				<Image source={{ uri: uri }} resizeMode={"contain"} style={{ height, width }} />
			</View>
		);
	}
}

export default StoryView;