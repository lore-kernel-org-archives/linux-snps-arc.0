From: robdclark@gmail.com (Rob Clark)
Date: Mon, 19 Feb 2018 20:25:57 -0500
Subject: [PATCH] fix double ;;s in code
In-Reply-To: <20180219193312.GA3709@amd>
References: <20180217211955.GE9640@amd>
 <187435d4-5017-edb5-9b6a-b433a148bfcc@c-s.fr>
 <20180219154135.GV22199@phenom.ffwll.local> <20180219193312.GA3709@amd>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAF6AEGu=pJa8nVqBDXZyKenCGi=FpjiKEYmMrMdSJD23mk1WJA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Feb 19, 2018@2:33 PM, Pavel Machek <pavel@ucw.cz> wrote:
> On Mon 2018-02-19 16:41:35, Daniel Vetter wrote:
>> On Sun, Feb 18, 2018@11:00:56AM +0100, Christophe LEROY wrote:
>> >
>> >
>> > Le 17/02/2018 ? 22:19, Pavel Machek a ?crit :
>> > >
>> > > Fix double ;;'s in code.
>> > >
>> > > Signed-off-by: Pavel Machek <pavel at ucw.cz>
>> >
>> > A summary of the files modified on top of the patch would help understand
>> > the impact.
>> >
>> > A maybe there should be one patch by area, eg one for each arch specific
>> > modif and one for drivers/ and one for block/ ?
>>
>> Yeah, pls split this into one patch per area, with a suitable patch
>> subject prefix. Look at git log of each file to get a feeling for what's
>> the standard in each area.
>
> Yeah I can spend hour spliting it, and then people will ignore it
> anyway.
>
> If you care about one of the files being modified, please fix the
> bug, ";;" is a clear bug.
>
> If you don't care ... well I don't care either.
>
> drivers/gpu/ has four entries, i guess that's something for you.

fwiw, one of those four is dup of a patch that I've already pushed to
msm-next for drm/msm (which seems to be an argument for splitting up a
treewide patch.. which seems something quite scriptable, but up to you
whether you want to bother with that.. either way drm/msm is ;;-clean
now)

BR,
-R


>                                                                 Pavel
>
>> > > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> > > index 61e8c3e..33d91e4 100644
>> > > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> > > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
>> > > @@ -718,7 +718,7 @@ static enum link_training_result perform_channel_equalization_sequence(
>> > >           uint32_t retries_ch_eq;
>> > >           enum dc_lane_count lane_count = lt_settings->link_settings.lane_count;
>> > >           union lane_align_status_updated dpcd_lane_status_updated = {{0}};
>> > > - union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {{{0}}};;
>> > > + union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX] = {{{0}}};
>> > >           hw_tr_pattern = get_supported_tp(link);
>> > > diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
>> > > index 4c3223a..adb6e7b 100644
>> > > --- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
>> > > +++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
>> > > @@ -162,7 +162,7 @@ static int pp_hw_init(void *handle)
>> > >                   if(hwmgr->smumgr_funcs->start_smu(pp_handle->hwmgr)) {
>> > >                           pr_err("smc start failed\n");
>> > >                           hwmgr->smumgr_funcs->smu_fini(pp_handle->hwmgr);
>> > > -                 return -EINVAL;;
>> > > +                 return -EINVAL;
>> > >                   }
>> > >                   if (ret == PP_DPM_DISABLED)
>> > >                           goto exit;
>> > > diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
>> > > index 3e9bba4..6d8e3a9 100644
>> > > --- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
>> > > +++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_kms.c
>> > > @@ -680,7 +680,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>> > >           } else {
>> > >                   dev_info(&pdev->dev,
>> > >                            "no iommu, fallback to phys contig buffers for scanout\n");
>> > > -         aspace = NULL;;
>> > > +         aspace = NULL;
>> > >           }
>> > >           pm_runtime_put_sync(&pdev->dev);
>> > > diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler.c b/drivers/gpu/drm/scheduler/gpu_scheduler.c
>> > > index 2c18996..0d95888 100644
>> > > --- a/drivers/gpu/drm/scheduler/gpu_scheduler.c
>> > > +++ b/drivers/gpu/drm/scheduler/gpu_scheduler.c
>> > > @@ -461,7 +461,7 @@ void drm_sched_hw_job_reset(struct drm_gpu_scheduler *sched, struct drm_sched_jo
>> > >   {
>> > >           struct drm_sched_job *s_job;
>> > >           struct drm_sched_entity *entity, *tmp;
>> > > - int i;;
>> > > + int i;
>> > >           spin_lock(&sched->job_list_lock);
>> > >           list_for_each_entry_reverse(s_job, &sched->ring_mirror_list, node) {
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
