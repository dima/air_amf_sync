package airamfsync.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="businesses")]
  [Bindable]
  public class Business extends RxModel {
    public static const LABEL:String = "businessNumber";

    public var businessNumber:String = "";

    public var newBusiness:Boolean = false;

    public var name:String = "";

    public var phone:String = "";

    public var mobilePhone:String = "";

    public var fax:String = "";

    public var email:String = "";
    
    public var lastFeePaid:Number;

    [HasMany]
    public var addresses:ModelsCollection;
    
    public function Business() {
      super(LABEL);
    }
  }
}
