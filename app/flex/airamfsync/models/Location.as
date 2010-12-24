package airamfsync.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="locations")]
  [Bindable]
  public class Location extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";

    [BelongsTo]
    public var address:Address;

    public function Location() {
      super(LABEL);
    }
  }
}
