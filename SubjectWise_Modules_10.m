%%this script will calculate the Mdularity (Q) of a thresholded set of
%%metrices
%add path to new BCT toolbox
clear all;
bctFolder = '/Users/PSYC-klr3342/Documents/MATLAB/BCT/';
addpath(genpath(bctFolder));

%cd /Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_E
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_IR
%cd /Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/DPX_245

%select the task conditions
%matrixFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_E/summary_RAtanhcorr_Item-finalBetaScrubbed-160913.mat';
%matrixFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_E/summary_RAtanhcorr_Relation-finalBetaScrubbed-160913.mat';
%matrixFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_IR/summary_RAtanhcorr_ItemHit-finalBetaScrubbed-160913.mat';
matrixFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_IR/summary_RAtanhcorr_RelationHit-finalBetaScrubbed-160913.mat';
%matrixFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/DPX_245/summary_RAtanhcorr_BCue-finalBetaScrubbed-160913.mat';

%load the adj mats
LoadedVariables = load(matrixFile)

%Specify that we are looking at HC subjects for now
HC_adjMats = LoadedVariables.OutStruct.allCorrelations{1,1};

%Preallocate matrices
Modularity_Qsub = zeros(1, size(HC_adjMats, 3));
FC_threshold10 = zeros(245,245,size(HC_adjMats,3));
M= zeros(1000,245);
Q = zeros(1,1000);

for jSubj = 1:size(HC_adjMats, 3)
    subjectMatrix = HC_adjMats(:, :, jSubj);
    subjectMatrix(isnan(subjectMatrix)) = 0;
    subjectMatrix = threshold_proportional(subjectMatrix, 0.05);
    
    FC_threshold10(:,:,jSubj) = subjectMatrix;
    
    %run community/modularity 1000 times on each subjects 10% threshld fc mat
    
    for a = 1:1000
        [M(a,:) Q(a)] = community_louvain(subjectMatrix);
    end
        
    for a = 1:1000
    numnodes(a) = max(M(a,:));
    for b = 1:max(M(a,:))
        mods{a,b} = find(M(a,:)==b);
        modvectors{a,b} = M(a,:);
    end  
        
    %[M(jSubj,:) Q(jSubj)] = community_louvain(subjectMatrix);   
    
    [maxQval,Index] = max(Q);
    Modularity_Qsub(jSubj) = Q(jSubj);
    maxQmodvector(jSubj, :)= M(Index,:);
    end
end


save('SubjectWise_Q_IR_Relation_05.mat', 'FC_threshold05', 'Modularity_Qsub', 'maxQmodvector');
%save('SubjectWise_Q_BCue_05.mat', 'FC_threshold10', 'Modularity_Qsub', 'maxQmodvector');
