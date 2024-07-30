import { IXWaterFlowItem } from '../datasource/IXWaterFlowItem';
import { XWaterFlowDataSource } from '../datasource/XWaterFlowDataSource';
import { FrameNode, NodeController, UIContext } from '@kit.ArkUI';

@Component
export struct XWaterFlow {
  @Require @Prop dataArray: IXWaterFlowItem[];
  @Prop initialCount: number;
  @Prop pushPosition: number = 20;
  @Prop pushCount: number = 50;
  @Prop colsCount: number = 2;

  dataControllerArray: XWaterFlowNodeController[] = this.dataArray.map(item => new XWaterFlowNodeController(item));
  dataSource: XWaterFlowDataSource<IXWaterFlowItem> = new XWaterFlowDataSource<IXWaterFlowItem>(this.dataArray, this.initialCount);

  getColsTemplate($$: number) {
    let colsTemplate: string = ''
    for (let i = 0; i < $$; i++) {
      colsTemplate += '1fr ';
    }
    return colsTemplate;
  }

  build() {
    WaterFlow() {
      LazyForEach(this.dataSource, (_: IXWaterFlowItem, index: number) => {
        FlowItem() {
          NodeContainer(this.dataControllerArray[index])
        }
        .onAppear(() => {
          console.log("Generated item of index " + index);
          if (index + this.pushPosition === this.dataSource.totalCount()) {
            this.dataSource.pushData(this.pushCount);
          }
        })
        .width('100%')
        .height('auto')
      }, (_: IXWaterFlowItem, index: number) => index.toString())
    }
    // TODO PROPS
    .columnsTemplate(this.getColsTemplate(this.colsCount))
    .columnsGap(10)
    .rowsGap(5)
    .width('100%')
    .height('100%')
  }
}

class XWaterFlowNodeController extends NodeController {
  private item: IXWaterFlowItem;

  constructor(item: IXWaterFlowItem) {
    super();
    this.item = item;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    return this.item.render(uiContext);
  }

  public getItem(): IXWaterFlowItem {
    return this.item;
  }
}