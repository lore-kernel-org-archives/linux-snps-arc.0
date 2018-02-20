From: alexdeucher@gmail.com (Alex Deucher)
Date: Tue, 20 Feb 2018 11:34:20 -0500
Subject: [PATCH] fix double ;;s in code
In-Reply-To: <87o9kkcck3.fsf@intel.com>
References: <20180217211955.GE9640@amd>
 <187435d4-5017-edb5-9b6a-b433a148bfcc@c-s.fr>
 <20180219154135.GV22199@phenom.ffwll.local> <20180219193312.GA3709@amd>
 <87o9kkcck3.fsf@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CADnq5_MY932hPkozosY4ODa5tB3qf7TYNxph1mt_qswkU4tBgw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Feb 20, 2018 at 3:03 AM, Jani Nikula
<jani.nikula@linux.intel.com> wrote:
> On Mon, 19 Feb 2018, Pavel Machek <pavel@ucw.cz> wrote:
>> On Mon 2018-02-19 16:41:35, Daniel Vetter wrote:
>>> Yeah, pls split this into one patch per area, with a suitable patch
>>> subject prefix. Look at git log of each file to get a feeling for what's
>>> the standard in each area.
>>
>> Yeah I can spend hour spliting it, and then people will ignore it
>> anyway.
>>
>> If you care about one of the files being modified, please fix the
>> bug, ";;" is a clear bug.
>>
>> If you don't care ... well I don't care either.
>
> Look, if this causes just one conflict down the line because it touches
> the kernel all over the place, then IMO it already wasn't worth
> it. Merge conflicts are inevitable, but there's no reason to make life
> harder just to cater for a cleanup patch. It's not that important.
>
> Had it been split up, the drm parts would've been merged already.

FWIW, the amdgpu and scheduler changes have already been fixed for -next.

Alex

>
> BR,
> Jani.
>
> --
> Jani Nikula, Intel Open Source Technology Center
> _______________________________________________
> amd-gfx mailing list
> amd-gfx at lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
