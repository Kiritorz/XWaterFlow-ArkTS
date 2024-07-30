import { IXWaterFlowItem } from '../datasource/IXWaterFlowItem';
import { UIContext } from '@ohos.arkui.UIContext';
import { FrameNode } from '@kit.ArkUI';
import { XWaterFlow } from '../components/XWaterFlow';

@Entry
@Component
struct Index {
  @State myDataArray: MyXWaterFlowItem[] = [
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple'),
    new MyXWaterFlowItem('Alice'),
    new MyXWaterFlowItem('Bob'),
    new MyXWaterFlowItem('Huawei'),
    new MyXWaterFlowItem('Harmony'),
    new MyXWaterFlowItem('Apple')
  ]

  build() {
    Column() {
      XWaterFlow({
        dataArray: this.myDataArray,
        initialCount: 10,
        pushPosition: 5,
        pushCount: 20,
        colsCount: 2
      })
    }
    .padding(10)
  }
}

class MyXWaterFlowItem implements IXWaterFlowItem {
  content: string;

  constructor(content: string) {
    this.content = content;
  }

  render(uiContext: UIContext): FrameNode {
    const node = new FrameNode(uiContext);
    node.commonAttribute.width('100%').height(200).backgroundColor(0xEEEEEE).borderWidth(1).borderRadius(12).borderColor(0xDDDDDD);
    // TODO typeNode.createNode() is not supported for across-platforms
    // const textNode = typeNode.createNode(uiContext, 'Text');
    // textNode.initialize(this.content).fontWeight(FontWeight.Medium);
    // node.appendChild(textNode);
    return node;
  }
}