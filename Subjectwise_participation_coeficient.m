% CNTRACS subject-wise participation coefficient from module partitions for high and low cognitive
% control conditions in the RiSE and DPX tasks

%add path to new BCT toolbox
%clear all;
bctFolder = '/Users/PSYC-klr3342/Documents/MATLAB/BCT/';
addpath(genpath(bctFolder));


%cd /Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_E
cd /Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_IR
%cd /Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/DPX_245


%select the task conditions
E_Item_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_E/SubjectWiseModularity_RISE_E_Item_gamma1.mat';
E_Rel_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_E/SubjectWiseModularity_RISE_E_Relation_gamma1.mat';
IR_Item_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_IR/SubjectWiseModularity_RISE_IR_Item_gamma1.mat';
IR_Rel_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/RISE_IR/SubjectWiseModularity_RISE_IR_Relation_gamma1.mat';
ACue_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/DPX_245/SubjectWiseModularity_DPX_ACue_gamma1.mat';
BCue_ModFile = '/Users/PSYC-klr3342/Desktop/UCD_manuscript/lssForKim/avgCorrelationMatrices/DPX_245/SubjectWiseModularity_DPX_BCue_gamma1.mat';

%   Participation coefficient is a measure of diversity of intermodular connections of individual nodes.
%   Inputs:     W,      binary/weighted, directed/undirected connection matrix
%               Ci,     community affiliation vector
%               flag,   0, undirected graph (default)
%   Output:     P,      participation coefficient
%load E_Item adj mats
 load(E_Item_ModFile)
for jSubj = 1:size(maxQmodvector, 1)
    P_E_Item(:,jSubj) = participation_coef(FC_threshold05(:,:,jSubj),maxQmodvector(jSubj,:),0);
end

%load E_Rel adj mats
 load(E_Rel_ModFile)
for jSubj = 1:size(maxQmodvector, 1)
    P_E_Rel(:,jSubj) = participation_coef(FC_threshold05(:,:,jSubj),maxQmodvector(jSubj,:),0);
end
%load IR_Item adj mats
 load(IR_Item_ModFile)
for jSubj = 1:size(maxQmodvector, 1)
    P_IR_Item(:,jSubj) = participation_coef(FC_threshold05(:,:,jSubj),maxQmodvector(jSubj,:),0);
end
%load IR_Rel adj mats
 load(IR_Rel_ModFile)
for jSubj = 1:size(maxQmodvector, 1)
    P_IR_Rel(:,jSubj) = participation_coef(FC_threshold05(:,:,jSubj),maxQmodvector(jSubj,:),0);
end
%load ACue adj mats
 load(ACue_ModFile)
for jSubj = 1:size(maxQmodvector, 1)
    P_ACue(:,jSubj) = participation_coef(FC_threshold05(:,:,jSubj),maxQmodvector(jSubj,:),0);
end
%load BCue adj mats
 load(BCue_ModFile)
for jSubj = 1:size(maxQmodvector, 1)
    P_BCue(:,jSubj) = participation_coef(FC_threshold05(:,:,jSubj),maxQmodvector(jSubj,:),0);
end

save('SubjectWise_ParticipationCoeficient_HC05.mat', 'P_E_Item','P_E_Rel','P_IR_Item','P_IR_Rel','P_ACue','P_BCue');

%export FPN Participation Coeficients this numbering is from the 245 study
%specific nodes (a loose correspondence from Power et al)

P_E_Item_FPN = P_E_Item([158:165 169:185],:);
P_E_Rel_FPN = P_E_Rel([158:165 169:185],:);
P_IR_Item_FPN = P_IR_Item([158:165 169:185],:);
P_IR_Rel_FPN = P_IR_Rel([158:165 169:185],:);
P_ACue_FPN = P_ACue([158:165 169:185],:);
P_BCue_FPN = P_BCue([158:165 169:185],:);
save('SubjectWise_ParticipationCoeficient_HC05_FPN.mat', 'P_E_Item_FPN','P_E_Rel_FPN','P_IR_Item_FPN','P_IR_Rel_FPN','P_ACue_FPN','P_BCue_FPN');

%t-test comparing Participation Coef of high vs low CC conditions 
[h,p,ci,stats] = ttest(mean(P_E_Item_FPN),mean(P_E_Rel_FPN)) %p = 0.2812    %Wholebrain p = 0.41
[h,p,ci,stats] = ttest(mean(P_IR_Item_FPN),mean(P_IR_Rel_FPN)) % p = 0.6170  %Wholebrain p = 0.31
[h,p,ci,stats] = ttest(mean(P_ACue_FPN),mean(P_BCue_FPN)) %p = 0.0084  %Wholebrain p = 0.0023
%repeated measures anova - need to adjust for subjects not in DPX
%IF we remove subject 3, 28, 39, 43 from RISE then there are equal subjects
%for a repeated measures anova
CNTRACS_table = table([1:56]', mean(P_E_Item)', mean(P_E_Rel)', mean(P_IR_Item)', mean(P_IR_Rel)','VariableNames',{'Subject', 'E_Item', 'E_Rel', 'IR_Item', 'IR_Rel'})