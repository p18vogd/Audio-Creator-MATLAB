classdef app_pre_exported1 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        PlaygroundTab                   matlab.ui.container.Tab
        GeneralAudioFeaturesPanel       matlab.ui.container.Panel
        BassSliderLabel                 matlab.ui.control.Label
        BassSlider                      matlab.ui.control.Slider
        TimeEditFieldLabel              matlab.ui.control.Label
        TimeEditField                   matlab.ui.control.NumericEditField
        MaxLabel                        matlab.ui.control.Label
        NoneLabel                       matlab.ui.control.Label
        PlayButton                      matlab.ui.control.Button
        StopButton                      matlab.ui.control.Button
        SaveButton                      matlab.ui.control.Button
        PresetAudioPanel                matlab.ui.container.Panel
        SoundsDropDownLabel             matlab.ui.control.Label
        SoundsDropDown                  matlab.ui.control.DropDown
        AudioButton                     matlab.ui.control.Button
        SaveButton_2                    matlab.ui.control.Button
        UIAxes                          matlab.ui.control.UIAxes
        AudioFeaturesPanel              matlab.ui.container.Panel
        HarmonyKnobLabel                matlab.ui.control.Label
        HarmonyKnob                     matlab.ui.control.Knob
        WidenessKnobLabel               matlab.ui.control.Label
        WidenessKnob                    matlab.ui.control.Knob
        BriefnessKnobLabel              matlab.ui.control.Label
        BriefnessKnob                   matlab.ui.control.Knob
        NameoffileyouwanttosaveEditFieldLabel  matlab.ui.control.Label
        NameoffileyouwanttosaveEditField  matlab.ui.control.EditField
        Label                           matlab.ui.control.Label
        ThewidenessofthesounddependsontheamoundofharmonyyouchoseLabel  matlab.ui.control.Label
        AudioGeneratorTab               matlab.ui.container.Tab
        UIAxes2                         matlab.ui.control.UIAxes
        DurationEditFieldLabel          matlab.ui.control.Label
        DurationEditField               matlab.ui.control.NumericEditField
        SamplesperSecondEditFieldLabel  matlab.ui.control.Label
        SamplesperSecondEditField       matlab.ui.control.NumericEditField
        HertzHzEditFieldLabel           matlab.ui.control.Label
        HertzHzEditField                matlab.ui.control.NumericEditField
        HarmonyRangeFromEditFieldLabel  matlab.ui.control.Label
        HarmonyRangeFromEditField       matlab.ui.control.NumericEditField
        PlayButton_2                    matlab.ui.control.Button
        StopButton_2                    matlab.ui.control.Button
        SaveButton_3                    matlab.ui.control.Button
        NameoffileyouwanttosaveEditField_2Label  matlab.ui.control.Label
        NameoffileyouwanttosaveEditField_2  matlab.ui.control.EditField
        Mustbe1000Label                 matlab.ui.control.Label
        HumanEar17Hz20000HzLabel        matlab.ui.control.Label
        ToEditFieldLabel                matlab.ui.control.Label
        ToEditField                     matlab.ui.control.NumericEditField
        AudioGeneratorLabel             matlab.ui.control.Label
        InthissectionoftheappyouencouragedtotrytocreateLabel  matlab.ui.control.Label
        InthissectionoftheappyouencouragedtotrytocreateLabel_2  matlab.ui.control.Label
        InthissectionoftheappyouencouragedtotrytocreateLabel_3  matlab.ui.control.Label
        InthissectionoftheappyouencouragedtotrytocreateLabel_4  matlab.ui.control.Label
        InthissectionoftheappyouencouragedtotrytocreateLabel_5  matlab.ui.control.Label
        InthissectionoftheappyouencouragedtotrytocreateLabel_6  matlab.ui.control.Label
        InthissectionoftheappyouencouragedtotrytocreateLabel_7  matlab.ui.control.Label
        ThisvaluemustbebiggerthanthepreviousLabel  matlab.ui.control.Label
        Recommendedrange030Label        matlab.ui.control.Label
    end

    methods (Access = private)

        % Button pushed function: AudioButton
        function AudioButtonPushed(app, event)
              clear sound;
            if(strcmp(app.SoundsDropDown.Value,'Chinese Gong')==1)
                load Gong;
                sound(y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Laughter')==1)
                load laughter;
                sound(y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Chirp')==1)
                load chirp;
                sound(y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Train')==1)
                load train;
                sound(y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Handel')==1)
                load handel;
                sound(y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Splat')==1)
                load splat;
                sound(y,Fs);
            end
            
            %app.UIAxes.YLim = [-1000 1000];
        end

        % Button pushed function: SaveButton_2
        function SaveButton_2Pushed(app, event)
            if(strcmp(app.SoundsDropDown.Value,'Chinese Gong')==1)
                load Gong;
                audiowrite('Gong.wav',y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Laughter')==1)
                load laughter;
                audiowrite('Laughter.wav',y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Chirp')==1)
                load chirp;
                audiowrite('Chirp.wav',y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Train')==1)
                load train;
                audiowrite('Train.wav',y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Handel')==1)
                load handel;
                audiowrite('Handel.wav',y,Fs);
            elseif(strcmp(app.SoundsDropDown.Value,'Splat')==1)
                load splat;
                audiowrite('Splat.wav',y,Fs);
            end
            
            clear y Fs;
        end

        % Button pushed function: StopButton
        function StopButtonPushed(app, event)
            clear sound;
        end

        % Value changed function: HarmonyKnob
        function HarmonyKnobValueChanged(app, event)
            value = app.HarmonyKnob.Value;
            
        end

        % Value changed function: WidenessKnob
        function WidenessKnobValueChanged(app, event)
            value = app.WidenessKnob.Value;
            
        end

        % Value changed function: BriefnessKnob
        function BriefnessKnobValueChanged(app, event)
            value = app.BriefnessKnob.Value;
            
        end

        % Button pushed function: PlayButton
        function PlayButtonPushed(app, event)
            clear sound;

            freq1 = app.BassSlider.Value;
            harm = 1:app.HarmonyKnob.Value:app.WidenessKnob.Value;
            freq = harm * freq1;

            w = 2 * pi *freq;

            tf = app.TimeEditField.Value;
            Fs = 45100;
            t = linspace(0,tf,tf*Fs);
            x = zeros(size(t));
            zeta = app.BriefnessKnob.Value;

            for cnt=1:length(w)
              x = x + sin(w(cnt) * t) .* exp(-zeta * w(cnt)*t)/((cnt - 1) * 1.5 + 1);
            end
            x = x / max(x);
            x1 = [x x x x];
            sound(x,Fs);
            plot(app.UIAxes,x);
        end

        % Value changed function: BassSlider
        function BassSliderValueChanged(app, event)
            value = app.BassSlider.Value;
            
        end

        % Value changed function: TimeEditField
        function TimeEditFieldValueChanged(app, event)
            value = app.TimeEditField.Value;
            
        end

        % Button pushed function: SaveButton
        function SaveButtonPushed(app, event)
             freq1 = app.BassSlider.Value;
            harm = 1:app.HarmonyKnob.Value:app.WidenessKnob.Value;
            freq = harm * freq1;

            w = 2 * pi *freq;

            tf = app.TimeEditField.Value;
            Fs = 45100;
            t = linspace(0,tf,tf*Fs);
            x = zeros(size(t));
            zeta = app.BriefnessKnob.Value;

            for cnt=1:length(w)
              x = x + sin(w(cnt) * t) .* exp(-zeta * w(cnt)*t)/((cnt - 1) * 1.5 + 1);
            end
            x = x / max(x);
            audiowrite(app.NameoffileyouwanttosaveEditField.Value+".wav",x,Fs);
        end

        % Value changed function: NameoffileyouwanttosaveEditField
        function NameoffileyouwanttosaveEditFieldValueChanged(app, event)
            value = app.NameoffileyouwanttosaveEditField.Value;
            
        end

        % Value changed function: HertzHzEditField
        function HertzHzEditFieldValueChanged(app, event)
            value = app.HertzHzEditField.Value;
            
        end

        % Button pushed function: PlayButton_2
        function PlayButton_2Pushed(app, event)
            clear sound;

            freq1 = app.HertzHzEditField.Value;
            harm = 1:app.HarmonyRangeFromEditField.Value:app.ToEditField.Value;
            freq = harm * freq1;
            w = 2* pi *freq;

            tf = app.DurationEditField.Value;
            Fs = app.SamplesperSecondEditField.Value;
            t = linspace(0,tf,tf*Fs);
            x = zeros(size(t));
            zeta = 0.0009;

            for cnt=1:length(w)
              x = x + sin(w(cnt) * t);
            end
            x = x / max(x);
            sound(x,Fs);
            plot(app.UIAxes2,x);
        end

        % Value changed function: DurationEditField
        function DurationEditFieldValueChanged(app, event)
            value = app.DurationEditField.Value;
            
        end

        % Value changed function: SamplesperSecondEditField
        function SamplesperSecondEditFieldValueChanged(app, event)
            value = app.SamplesperSecondEditField.Value;
            
        end

        % Button pushed function: StopButton_2
        function StopButton_2Pushed(app, event)
            clear sound;
        end

        % Button pushed function: SaveButton_3
        function SaveButton_3Pushed(app, event)
            
            freq1 = app.HertzHzEditField.Value;
            harm = 1:app.HarmonyRangeFromEditField.Value:app.ToEditField.Value;
            freq = harm * freq1;
            w = 2* pi *freq;

            tf = app.DurationEditField.Value;
            Fs = app.SamplesperSecondEditField.Value;
            t = linspace(0,tf,tf*Fs);
            x = zeros(size(t));
            zeta = 0.0009;

            for cnt=1:length(w)
              x = x + sin(w(cnt) * t);
            end
            x = x / max(x);
            audiowrite(app.NameoffileyouwanttosaveEditField_2.Value+".wav",x,Fs);
            
        end

        % Value changed function: NameoffileyouwanttosaveEditField_2
        function NameoffileyouwanttosaveEditField_2ValueChanged(app, event)
            value = app.NameoffileyouwanttosaveEditField_2.Value;
            
        end

        % Value changed function: HarmonyRangeFromEditField
        function HarmonyRangeFromEditFieldValueChanged(app, event)
            value = app.HarmonyRangeFromEditField.Value;
            
        end

        % Value changed function: ToEditField
        function ToEditFieldValueChanged(app, event)
            value = app.ToEditField.Value;
            
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 953 504];
            app.UIFigure.Name = 'UI Figure';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 953 504];

            % Create PlaygroundTab
            app.PlaygroundTab = uitab(app.TabGroup);
            app.PlaygroundTab.Title = 'Playground';

            % Create GeneralAudioFeaturesPanel
            app.GeneralAudioFeaturesPanel = uipanel(app.PlaygroundTab);
            app.GeneralAudioFeaturesPanel.Title = 'General Audio Features';
            app.GeneralAudioFeaturesPanel.Position = [10 291 299 169];

            % Create BassSliderLabel
            app.BassSliderLabel = uilabel(app.GeneralAudioFeaturesPanel);
            app.BassSliderLabel.HorizontalAlignment = 'right';
            app.BassSliderLabel.Position = [12 111 32 22];
            app.BassSliderLabel.Text = 'Bass';

            % Create BassSlider
            app.BassSlider = uislider(app.GeneralAudioFeaturesPanel);
            app.BassSlider.Limits = [-100 1000];
            app.BassSlider.ValueChangedFcn = createCallbackFcn(app, @BassSliderValueChanged, true);
            app.BassSlider.Position = [65 120 150 3];

            % Create TimeEditFieldLabel
            app.TimeEditFieldLabel = uilabel(app.GeneralAudioFeaturesPanel);
            app.TimeEditFieldLabel.HorizontalAlignment = 'right';
            app.TimeEditFieldLabel.Position = [32 36 31 22];
            app.TimeEditFieldLabel.Text = 'Time';

            % Create TimeEditField
            app.TimeEditField = uieditfield(app.GeneralAudioFeaturesPanel, 'numeric');
            app.TimeEditField.ValueChangedFcn = createCallbackFcn(app, @TimeEditFieldValueChanged, true);
            app.TimeEditField.Position = [78 36 100 22];

            % Create MaxLabel
            app.MaxLabel = uilabel(app.GeneralAudioFeaturesPanel);
            app.MaxLabel.FontSize = 9;
            app.MaxLabel.Position = [62 122 28 24];
            app.MaxLabel.Text = 'Max';

            % Create NoneLabel
            app.NoneLabel = uilabel(app.GeneralAudioFeaturesPanel);
            app.NoneLabel.FontSize = 9;
            app.NoneLabel.Position = [187 122 28 24];
            app.NoneLabel.Text = 'None';

            % Create PlayButton
            app.PlayButton = uibutton(app.PlaygroundTab, 'push');
            app.PlayButton.ButtonPushedFcn = createCallbackFcn(app, @PlayButtonPushed, true);
            app.PlayButton.Position = [592 52 78 22];
            app.PlayButton.Text = 'Play';

            % Create StopButton
            app.StopButton = uibutton(app.PlaygroundTab, 'push');
            app.StopButton.ButtonPushedFcn = createCallbackFcn(app, @StopButtonPushed, true);
            app.StopButton.Position = [697 52 100 22];
            app.StopButton.Text = 'Stop';

            % Create SaveButton
            app.SaveButton = uibutton(app.PlaygroundTab, 'push');
            app.SaveButton.ButtonPushedFcn = createCallbackFcn(app, @SaveButtonPushed, true);
            app.SaveButton.Position = [821 52 88 22];
            app.SaveButton.Text = 'Save';

            % Create PresetAudioPanel
            app.PresetAudioPanel = uipanel(app.PlaygroundTab);
            app.PresetAudioPanel.Title = 'Preset Audio';
            app.PresetAudioPanel.Position = [324 291 242 169];

            % Create SoundsDropDownLabel
            app.SoundsDropDownLabel = uilabel(app.PresetAudioPanel);
            app.SoundsDropDownLabel.HorizontalAlignment = 'right';
            app.SoundsDropDownLabel.Position = [50 110 46 22];
            app.SoundsDropDownLabel.Text = 'Sounds';

            % Create SoundsDropDown
            app.SoundsDropDown = uidropdown(app.PresetAudioPanel);
            app.SoundsDropDown.Items = {'Chinese Gong', 'Chirp', 'Laughter', 'Train', 'Handel', 'Splat'};
            app.SoundsDropDown.Position = [111 110 100 22];
            app.SoundsDropDown.Value = 'Chinese Gong';

            % Create AudioButton
            app.AudioButton = uibutton(app.PresetAudioPanel, 'push');
            app.AudioButton.ButtonPushedFcn = createCallbackFcn(app, @AudioButtonPushed, true);
            app.AudioButton.Position = [30 23 78 22];
            app.AudioButton.Text = 'Audio';

            % Create SaveButton_2
            app.SaveButton_2 = uibutton(app.PresetAudioPanel, 'push');
            app.SaveButton_2.ButtonPushedFcn = createCallbackFcn(app, @SaveButton_2Pushed, true);
            app.SaveButton_2.Position = [141 23 88 22];
            app.SaveButton_2.Text = 'Save';

            % Create UIAxes
            app.UIAxes = uiaxes(app.PlaygroundTab);
            title(app.UIAxes, 'Visual Presentation of the sound')
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            app.UIAxes.Position = [592 117 317 343];

            % Create AudioFeaturesPanel
            app.AudioFeaturesPanel = uipanel(app.PlaygroundTab);
            app.AudioFeaturesPanel.Title = 'Audio Features';
            app.AudioFeaturesPanel.Position = [10 26 564 254];

            % Create HarmonyKnobLabel
            app.HarmonyKnobLabel = uilabel(app.AudioFeaturesPanel);
            app.HarmonyKnobLabel.HorizontalAlignment = 'center';
            app.HarmonyKnobLabel.Position = [37 40 54 22];
            app.HarmonyKnobLabel.Text = 'Harmony';

            % Create HarmonyKnob
            app.HarmonyKnob = uiknob(app.AudioFeaturesPanel, 'continuous');
            app.HarmonyKnob.Limits = [1 10];
            app.HarmonyKnob.ValueChangedFcn = createCallbackFcn(app, @HarmonyKnobValueChanged, true);
            app.HarmonyKnob.Position = [33 96 60 60];
            app.HarmonyKnob.Value = 1;

            % Create WidenessKnobLabel
            app.WidenessKnobLabel = uilabel(app.AudioFeaturesPanel);
            app.WidenessKnobLabel.HorizontalAlignment = 'center';
            app.WidenessKnobLabel.Position = [240 40 58 22];
            app.WidenessKnobLabel.Text = 'Wideness';

            % Create WidenessKnob
            app.WidenessKnob = uiknob(app.AudioFeaturesPanel, 'continuous');
            app.WidenessKnob.Limits = [0 30];
            app.WidenessKnob.ValueChangedFcn = createCallbackFcn(app, @WidenessKnobValueChanged, true);
            app.WidenessKnob.Position = [239 96 60 60];
            app.WidenessKnob.Value = 1;

            % Create BriefnessKnobLabel
            app.BriefnessKnobLabel = uilabel(app.AudioFeaturesPanel);
            app.BriefnessKnobLabel.HorizontalAlignment = 'center';
            app.BriefnessKnobLabel.Position = [442.5 40 55 22];
            app.BriefnessKnobLabel.Text = 'Briefness';

            % Create BriefnessKnob
            app.BriefnessKnob = uiknob(app.AudioFeaturesPanel, 'continuous');
            app.BriefnessKnob.Limits = [0.001 0.009];
            app.BriefnessKnob.ValueChangedFcn = createCallbackFcn(app, @BriefnessKnobValueChanged, true);
            app.BriefnessKnob.Position = [440 96 60 60];
            app.BriefnessKnob.Value = 0.001;

            % Create NameoffileyouwanttosaveEditFieldLabel
            app.NameoffileyouwanttosaveEditFieldLabel = uilabel(app.PlaygroundTab);
            app.NameoffileyouwanttosaveEditFieldLabel.HorizontalAlignment = 'right';
            app.NameoffileyouwanttosaveEditFieldLabel.Position = [612 15 163 22];
            app.NameoffileyouwanttosaveEditFieldLabel.Text = 'Name of file you want to save';

            % Create NameoffileyouwanttosaveEditField
            app.NameoffileyouwanttosaveEditField = uieditfield(app.PlaygroundTab, 'text');
            app.NameoffileyouwanttosaveEditField.ValueChangedFcn = createCallbackFcn(app, @NameoffileyouwanttosaveEditFieldValueChanged, true);
            app.NameoffileyouwanttosaveEditField.Position = [790 15 100 22];

            % Create Label
            app.Label = uilabel(app.PlaygroundTab);
            app.Label.VerticalAlignment = 'bottom';
            app.Label.FontSize = 9;
            app.Label.FontAngle = 'italic';
            app.Label.Position = [10 15 660 22];
            app.Label.Text = 'Tip: Harmony and Widness are combined together to deliver unique sounds each time. The wideness of the sound depends on the ';

            % Create ThewidenessofthesounddependsontheamoundofharmonyyouchoseLabel
            app.ThewidenessofthesounddependsontheamoundofharmonyyouchoseLabel = uilabel(app.PlaygroundTab);
            app.ThewidenessofthesounddependsontheamoundofharmonyyouchoseLabel.FontSize = 9;
            app.ThewidenessofthesounddependsontheamoundofharmonyyouchoseLabel.FontAngle = 'italic';
            app.ThewidenessofthesounddependsontheamoundofharmonyyouchoseLabel.Position = [9 0 433 22];
            app.ThewidenessofthesounddependsontheamoundofharmonyyouchoseLabel.Text = ' amound of harmony you chose. Try to give higher value to wideness than harrmony for a more flat sound';

            % Create AudioGeneratorTab
            app.AudioGeneratorTab = uitab(app.TabGroup);
            app.AudioGeneratorTab.Title = 'Audio Generator';

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.AudioGeneratorTab);
            title(app.UIAxes2, 'Visualization of the sound')
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            app.UIAxes2.Position = [358 137 537 326];

            % Create DurationEditFieldLabel
            app.DurationEditFieldLabel = uilabel(app.AudioGeneratorTab);
            app.DurationEditFieldLabel.HorizontalAlignment = 'right';
            app.DurationEditFieldLabel.Position = [18 167 51 22];
            app.DurationEditFieldLabel.Text = 'Duration';

            % Create DurationEditField
            app.DurationEditField = uieditfield(app.AudioGeneratorTab, 'numeric');
            app.DurationEditField.ValueChangedFcn = createCallbackFcn(app, @DurationEditFieldValueChanged, true);
            app.DurationEditField.Position = [84 167 100 22];

            % Create SamplesperSecondEditFieldLabel
            app.SamplesperSecondEditFieldLabel = uilabel(app.AudioGeneratorTab);
            app.SamplesperSecondEditFieldLabel.HorizontalAlignment = 'right';
            app.SamplesperSecondEditFieldLabel.Position = [18 203 117 22];
            app.SamplesperSecondEditFieldLabel.Text = 'Samples per Second';

            % Create SamplesperSecondEditField
            app.SamplesperSecondEditField = uieditfield(app.AudioGeneratorTab, 'numeric');
            app.SamplesperSecondEditField.ValueChangedFcn = createCallbackFcn(app, @SamplesperSecondEditFieldValueChanged, true);
            app.SamplesperSecondEditField.Position = [150 203 100 22];

            % Create HertzHzEditFieldLabel
            app.HertzHzEditFieldLabel = uilabel(app.AudioGeneratorTab);
            app.HertzHzEditFieldLabel.HorizontalAlignment = 'right';
            app.HertzHzEditFieldLabel.Position = [18 250 60 22];
            app.HertzHzEditFieldLabel.Text = 'Hertz (Hz)';

            % Create HertzHzEditField
            app.HertzHzEditField = uieditfield(app.AudioGeneratorTab, 'numeric');
            app.HertzHzEditField.ValueChangedFcn = createCallbackFcn(app, @HertzHzEditFieldValueChanged, true);
            app.HertzHzEditField.Position = [93 250 100 22];

            % Create HarmonyRangeFromEditFieldLabel
            app.HarmonyRangeFromEditFieldLabel = uilabel(app.AudioGeneratorTab);
            app.HarmonyRangeFromEditFieldLabel.HorizontalAlignment = 'right';
            app.HarmonyRangeFromEditFieldLabel.Position = [14 137 124 22];
            app.HarmonyRangeFromEditFieldLabel.Text = 'Harmony Range From';

            % Create HarmonyRangeFromEditField
            app.HarmonyRangeFromEditField = uieditfield(app.AudioGeneratorTab, 'numeric');
            app.HarmonyRangeFromEditField.ValueChangedFcn = createCallbackFcn(app, @HarmonyRangeFromEditFieldValueChanged, true);
            app.HarmonyRangeFromEditField.Position = [153 137 33 22];

            % Create PlayButton_2
            app.PlayButton_2 = uibutton(app.AudioGeneratorTab, 'push');
            app.PlayButton_2.ButtonPushedFcn = createCallbackFcn(app, @PlayButton_2Pushed, true);
            app.PlayButton_2.Position = [38 47 100 22];
            app.PlayButton_2.Text = 'Play';

            % Create StopButton_2
            app.StopButton_2 = uibutton(app.AudioGeneratorTab, 'push');
            app.StopButton_2.ButtonPushedFcn = createCallbackFcn(app, @StopButton_2Pushed, true);
            app.StopButton_2.Position = [171 47 100 22];
            app.StopButton_2.Text = 'Stop';

            % Create SaveButton_3
            app.SaveButton_3 = uibutton(app.AudioGeneratorTab, 'push');
            app.SaveButton_3.ButtonPushedFcn = createCallbackFcn(app, @SaveButton_3Pushed, true);
            app.SaveButton_3.Position = [301 47 100 22];
            app.SaveButton_3.Text = 'Save';

            % Create NameoffileyouwanttosaveEditField_2Label
            app.NameoffileyouwanttosaveEditField_2Label = uilabel(app.AudioGeneratorTab);
            app.NameoffileyouwanttosaveEditField_2Label.HorizontalAlignment = 'right';
            app.NameoffileyouwanttosaveEditField_2Label.Position = [553 47 163 22];
            app.NameoffileyouwanttosaveEditField_2Label.Text = 'Name of file you want to save';

            % Create NameoffileyouwanttosaveEditField_2
            app.NameoffileyouwanttosaveEditField_2 = uieditfield(app.AudioGeneratorTab, 'text');
            app.NameoffileyouwanttosaveEditField_2.ValueChangedFcn = createCallbackFcn(app, @NameoffileyouwanttosaveEditField_2ValueChanged, true);
            app.NameoffileyouwanttosaveEditField_2.Position = [731 47 100 22];

            % Create Mustbe1000Label
            app.Mustbe1000Label = uilabel(app.AudioGeneratorTab);
            app.Mustbe1000Label.VerticalAlignment = 'bottom';
            app.Mustbe1000Label.FontSize = 9;
            app.Mustbe1000Label.FontWeight = 'bold';
            app.Mustbe1000Label.Position = [150 224 67 22];
            app.Mustbe1000Label.Text = 'Must be >1000';

            % Create HumanEar17Hz20000HzLabel
            app.HumanEar17Hz20000HzLabel = uilabel(app.AudioGeneratorTab);
            app.HumanEar17Hz20000HzLabel.VerticalAlignment = 'bottom';
            app.HumanEar17Hz20000HzLabel.FontSize = 9;
            app.HumanEar17Hz20000HzLabel.FontWeight = 'bold';
            app.HumanEar17Hz20000HzLabel.Position = [93 271 151 22];
            app.HumanEar17Hz20000HzLabel.Text = 'Human Ear (~17 Hz - 20000 Hz)';

            % Create ToEditFieldLabel
            app.ToEditFieldLabel = uilabel(app.AudioGeneratorTab);
            app.ToEditFieldLabel.HorizontalAlignment = 'right';
            app.ToEditFieldLabel.Position = [192 137 25 22];
            app.ToEditFieldLabel.Text = 'To';

            % Create ToEditField
            app.ToEditField = uieditfield(app.AudioGeneratorTab, 'numeric');
            app.ToEditField.ValueChangedFcn = createCallbackFcn(app, @ToEditFieldValueChanged, true);
            app.ToEditField.Position = [232 137 28 22];

            % Create AudioGeneratorLabel
            app.AudioGeneratorLabel = uilabel(app.AudioGeneratorTab);
            app.AudioGeneratorLabel.FontWeight = 'bold';
            app.AudioGeneratorLabel.Position = [117 441 100 22];
            app.AudioGeneratorLabel.Text = 'Audio Generator';

            % Create InthissectionoftheappyouencouragedtotrytocreateLabel
            app.InthissectionoftheappyouencouragedtotrytocreateLabel = uilabel(app.AudioGeneratorTab);
            app.InthissectionoftheappyouencouragedtotrytocreateLabel.FontSize = 10;
            app.InthissectionoftheappyouencouragedtotrytocreateLabel.Position = [1 420 382 22];
            app.InthissectionoftheappyouencouragedtotrytocreateLabel.Text = 'In this section of the app you are encouraged to try to create sounds based on your ';

            % Create InthissectionoftheappyouencouragedtotrytocreateLabel_2
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_2 = uilabel(app.AudioGeneratorTab);
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_2.FontSize = 10;
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_2.Position = [0 396 405 22];
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_2.Text = 'four features.Time, Hertz which is the main frequency of the sound, Samples per Second';

            % Create InthissectionoftheappyouencouragedtotrytocreateLabel_3
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_3 = uilabel(app.AudioGeneratorTab);
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_3.FontSize = 10;
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_3.Position = [0 407 372 22];
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_3.Text = 'knowledge and imagination. As you see in this program audio is generated based';

            % Create InthissectionoftheappyouencouragedtotrytocreateLabel_4
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_4 = uilabel(app.AudioGeneratorTab);
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_4.FontSize = 10;
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_4.Position = [0 386 374 22];
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_4.Text = 'which is the number of samples played every second and finally Harmonic Range.';

            % Create InthissectionoftheappyouencouragedtotrytocreateLabel_5
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_5 = uilabel(app.AudioGeneratorTab);
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_5.FontSize = 10;
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_5.Position = [1 375 345 22];
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_5.Text = 'A harmonic is a sound wave that has a frequency that is an integer multiple ';

            % Create InthissectionoftheappyouencouragedtotrytocreateLabel_6
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_6 = uilabel(app.AudioGeneratorTab);
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_6.FontSize = 10;
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_6.Position = [0 365 383 22];
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_6.Text = 'of a fundamental tone. Feel free to generate your own audio whether you choose to ';

            % Create InthissectionoftheappyouencouragedtotrytocreateLabel_7
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_7 = uilabel(app.AudioGeneratorTab);
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_7.FontSize = 10;
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_7.Position = [0 354 319 22];
            app.InthissectionoftheappyouencouragedtotrytocreateLabel_7.Text = 'follow or not our recomentantion in bold text above the audio inputs :D';

            % Create ThisvaluemustbebiggerthanthepreviousLabel
            app.ThisvaluemustbebiggerthanthepreviousLabel = uilabel(app.AudioGeneratorTab);
            app.ThisvaluemustbebiggerthanthepreviousLabel.FontSize = 9;
            app.ThisvaluemustbebiggerthanthepreviousLabel.FontWeight = 'bold';
            app.ThisvaluemustbebiggerthanthepreviousLabel.Position = [228 116 195 22];
            app.ThisvaluemustbebiggerthanthepreviousLabel.Text = 'This value must be bigger than the previous';

            % Create Recommendedrange030Label
            app.Recommendedrange030Label = uilabel(app.AudioGeneratorTab);
            app.Recommendedrange030Label.FontSize = 9;
            app.Recommendedrange030Label.FontWeight = 'bold';
            app.Recommendedrange030Label.Position = [79 116 128 22];
            app.Recommendedrange030Label.Text = 'Recommended range (0 - 30)';
        end
    end

    methods (Access = public)

        % Construct app
        function app = app_pre_exported1

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end