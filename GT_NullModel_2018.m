%function [ output_args ] = GT_NullModel_2018(ITER)
%
%Takes an adjacency matrix, thresholds it, and then runs the BCT script
%'randmio_und_sign.m' to create a null matrix
%   
clear all; 
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/BCTmoduleAnalyses

%load('SingleSubjectMats_HC_FC05.mat');
load('SingleSubjectMats_HC_FC05.mat');
checkcount = 0;

%go through ACue 05 subjects

for jsubj = 1:52
    jsubj

    tempCorr = ACue_FC05(:,:,jsubj);
    
    [R,~] = randmio_und_signed(tempCorr, 100);

%modularity iterations
    for a = 1:1000
            [M(a,:) Q(a)] = community_louvain(R);
    end
    
    [maxQval(jsubj) maxQind] = max(Q)
    maxQmodvector(jsubj,:)= M(maxQind,:);
    meanQ(jsubj) = mean(Q);
    maxQ(jsubj) = max(Q);

%   Input:      W,      undirected (binary/weighted) connection matrix
%               ITER,   rewiring parameter
%                       (each edge is rewired approximately ITER times)
%
%   Output:     R,      randomized network
%               eff,    number of actual rewirings carried out



end
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript/New_Null_Models
save(strcat('ACue_HC_05NullModel.mat'),'maxQval', 'meanQ', 'maxQmodvector');

%figure, plot(0.05:0.05:0.6, maxQval, 'r')
%legend(gca , 'Mean Modularity')
%title('Mean Q Across Threshold Values')

%go through BCue 05 subjects

for jsubj = 1:52
    jsubj

    tempCorr = BCue_FC05(:,:,jsubj);
    
    [R,~] = randmio_und_signed(tempCorr, 100);

%modularity iterations
    for a = 1:1000
        
            [M(a,:) Q(a)] = community_louvain(R);
    end
    
    [maxQval(jsubj) maxQind] = max(Q);
   
    maxQmodvector(jsubj,:)= M(maxQind,:);
    
    meanQ(jsubj) = mean(Q);
    
    maxQ(jsubj) = max(Q);

%   Input:      W,      undirected (binary/weighted) connection matrix
%               ITER,   rewiring parameter
%                       (each edge is rewired approximately ITER times)
%
%   Output:     R,      randomized network
%               eff,    number of actual rewirings carried out



end
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript
save(strcat('BCue_HC_05NullModel.mat'),'maxQval', 'meanQ', 'maxQmodvector');


%go through E_Item 05 subjects

for jsubj = 1:56
    jsubj

    tempCorr = E_Item_FC05(:,:,jsubj);
    
    [R,~] = randmio_und_signed(tempCorr, 100);

%modularity iterations
    for a = 1:1000
        
            [M(a,:) Q(a)] = community_louvain(R);
    end
    
    [maxQval(jsubj) maxQind] = max(Q);
   
    maxQmodvector(jsubj,:)= M(maxQind,:);
    
    meanQ(jsubj) = mean(Q);
    
    maxQ(jsubj) = max(Q);

%   Input:      W,      undirected (binary/weighted) connection matrix
%               ITER,   rewiring parameter
%                       (each edge is rewired approximately ITER times)
%
%   Output:     R,      randomized network
%               eff,    number of actual rewirings carried out



end
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript
save(strcat('E_Item_HC_05NullModel.mat'),'maxQval', 'meanQ', 'maxQmodvector');

%go through E_Rel 05 subjects

for jsubj = 1:56
    jsubj

    tempCorr = E_Rel_FC05(:,:,jsubj);
    
    [R,~] = randmio_und_signed(tempCorr, 100);

%modularity iterations
    for a = 1:1000
        
            [M(a,:) Q(a)] = community_louvain(R);
    end
    
    [maxQval(jsubj) maxQind] = max(Q);
   
    maxQmodvector(jsubj,:)= M(maxQind,:);
    
    meanQ(jsubj) = mean(Q);
    
    maxQ(jsubj) = max(Q);

%   Input:      W,      undirected (binary/weighted) connection matrix
%               ITER,   rewiring parameter
%                       (each edge is rewired approximately ITER times)
%
%   Output:     R,      randomized network
%               eff,    number of actual rewirings carried out



end
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript
save(strcat('E_Rel_HC_05NullModel.mat'),'maxQval', 'meanQ', 'maxQmodvector');

%go through IR_Item 05 subjects

for jsubj = 1:56
    jsubj

    tempCorr = IR_Item_FC05(:,:,jsubj);
    
    [R,~] = randmio_und_signed(tempCorr, 100);

%modularity iterations
    for a = 1:1000
        
            [M(a,:) Q(a)] = community_louvain(R);
    end
    
    [maxQval(jsubj) maxQind] = max(Q);
   
    maxQmodvector(jsubj,:)= M(maxQind,:);
    
    meanQ(jsubj) = mean(Q);
    
    maxQ(jsubj) = max(Q);

%   Input:      W,      undirected (binary/weighted) connection matrix
%               ITER,   rewiring parameter
%                       (each edge is rewired approximately ITER times)
%
%   Output:     R,      randomized network
%               eff,    number of actual rewirings carried out



end
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript
save(strcat('IR_Item_HC_05NullModel.mat'),'maxQval', 'meanQ', 'maxQmodvector');

%go through IR_Rel 05 subjects

for jsubj = 1:56
    jsubj

    tempCorr = IR_Rel_FC05(:,:,jsubj);
    
    [R,~] = randmio_und_signed(tempCorr, 100);

%modularity iterations
    for a = 1:1000
        
            [M(a,:) Q(a)] = community_louvain(R);
    end
    
    [maxQval(jsubj) maxQind] = max(Q);
   
    maxQmodvector(jsubj,:)= M(maxQind,:);
    
    meanQ(jsubj) = mean(Q);
    
    maxQ(jsubj) = max(Q);

%   Input:      W,      undirected (binary/weighted) connection matrix
%               ITER,   rewiring parameter
%                       (each edge is rewired approximately ITER times)
%
%   Output:     R,      randomized network
%               eff,    number of actual rewirings carried out



end
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript
%Change for file name for each task/conditon
save(strcat('IR_Rel_HC_05NullModel.mat'),'maxQval', 'meanQ', 'maxQmodvector');

