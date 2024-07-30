export class XWaterFlowDataSource<T> implements IDataSource {
  private dataArray: T[] = [];
  private itemArray: T[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(dataArray: T[], initialCount: number = 10) {
    for (let i = 0; i < dataArray.length; i++) {
      this.dataArray.push(dataArray[i]);
      if (i < initialCount) {
        this.itemArray.push(dataArray[i]);
      }
    }
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) === -1) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const index = this.listeners.indexOf(listener);
    if (index !== -1) {
      this.listeners.splice(index, 1);
    }
  }

  public totalCount(): number {
    return this.itemArray.length;
  }

  public getData(index: number): T {
    return this.itemArray[index];
  }

  public reload(): void {
    this.notifyDataReload();
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  public pushData(count: number = 1): void {
    for (let i = this.itemArray.length; i < this.itemArray.length + count && i < this.dataArray.length; i++) {
      this.itemArray.push(this.dataArray[i]);
      this.notifyDataAdd(i);
    }
    console.log("Pushed " + count + " items from index " + this.itemArray.length);
  }

  public addData(data: T, index: number = 0): void {
    this.itemArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  public changeData(data: T, index: number = 0): void {
    this.itemArray.splice(index, 1, data);
    this.notifyDataChange(index);
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  public deleteData(index: number): void {
    this.itemArray.splice(index, 1);
    this.notifyDataDelete(index);
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  public moveData(from: number, to: number): void {
    const data: T = this.itemArray[from];
    this.itemArray.splice(from, 1);
    this.itemArray.splice(to, 0, data);
    this.notifyDataMove(from, to);
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }
}