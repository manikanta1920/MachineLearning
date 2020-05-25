% Remove last column
X = X_valid(:, 1:end-1);

% Save last column into X_label
X_label = X_valid(:, end);

% Estimate the intrinsic dimensionality of dataset 
no_dims = round(intrinsic_dim(X, 'MLE'));
disp(['MLE estimate of intrinsic dimensionality: ' num2str(no_dims)]);

%% Performs dimensionality reduction on the dataset

% Diffusion maps
[mappedX_DM, mapping_DM] = compute_mapping(X, 'DiffusionMaps', 12);
% Variability
cov_DM = cov(mappedX_DM);
eigs_DM = eig(cov_DM);
vars_DM = eigs_DM / sum(eigs_DM);
% Add label
mappedX_DM_Label = [mappedX_DM, X_label];