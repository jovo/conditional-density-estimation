function [yy,x,dim,standardizeCov]=importData(dataset)

if dataset==1
        load normal3 yy dim x
   
        standardizeCov=1;
else if dataset==2
        load dataFactor_highMix2 x yy dim
        standardizeCov=1;
    else if dataset==3
        load dataFactor_highMix3 x yy dim
        standardizeCov=1;
        else if dataset==4
                load MetabolomicsData yy xMetabBase xClinical drug xAll time
                
                x=xAll; 
                
                %% --- X=clinical at baseline
                dim=size(x); dim=dim(2); n=length(yy); varx=var(x);
                yy=(yy-mean(yy))./sqrt(var(yy)); n=length(yy); x=x(:,varx~=0); dim=sum(varx~=0);
                x=(x-ones(n,1)*mean(x))./(ones(n,1)*sqrt(varx(varx~=0)));
                
                %x(:,1:52)=(x(:,1:52)-ones(n,1)*mean(x(:,1:52)))./(ones(n,1)*sqrt(var(x(:,1:52))));
                standardizeCov=0;
                
                
                
            else if dataset==5
                load mrn_data_0915_rev3
                standardizeCov=1;
                yy=covars(:,1);
                for j=1:length(yy)
                   B = Acount(:,:,j); 
                   x(j,:)= B(tril(true(size(B)),-1))';
                end
                index=isnan(yy)~=1; yy=yy(index); x=x(index,:);
                yy=(yy-mean(yy))./sqrt(var(yy));
                else if dataset==6
                    load dataFactor_high x yy dim
                    dim=100000;
                    standardizeCov=1;
                    else if dataset==7
                        load dataFactor_highMix x yy dim
                        standardizeCov=1;
                    else if dataset==8
                        load lowerManifold x yy dim
                        standardizeCov=1;
                    else if dataset==9
                        load normal x yy dim
                        standardizeCov=1;
                    else if dataset==10
                        load normal2 x yy dim
                        standardizeCov=1;
                               else if dataset==11
                        load dataFactor_nonlinear x yy dim
                        standardizeCov=1;
                          else if dataset==12
                        load nonlinear x yy dim
                        standardizeCov=1;
                        else if dataset==13
                        load lowerManifold x yy dim
                        standardizeCov=1;
                        
                        end
                        end
                        end
                        end
                        
                        end
                        
                        end
                        
                        end
                    end
                end
            end
        end
    end
end
