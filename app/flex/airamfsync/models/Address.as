package airamfsync.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="addresses")]
  [Bindable]
  public class Address extends RxModel {
    public static const LABEL:String = "lineOne";

    public var lineOne:String = "";

    public var lineTwo:String = "";

    public var city:String = "";

    public var zip:String = "";

    public var state:String = "";

    public var country:String = "";

    [BelongsTo]
    public var business:Business;

    public function Address() {
      super(LABEL);
    }
  }
}
