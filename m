From: jani.nikula@linux.intel.com (Jani Nikula)
Date: Tue, 20 Feb 2018 10:03:56 +0200
Subject: [PATCH] fix double ;;s in code
In-Reply-To: <20180219193312.GA3709@amd>
References: <20180217211955.GE9640@amd>
 <187435d4-5017-edb5-9b6a-b433a148bfcc@c-s.fr>
 <20180219154135.GV22199@phenom.ffwll.local> <20180219193312.GA3709@amd>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87o9kkcck3.fsf@intel.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 19 Feb 2018, Pavel Machek <pavel@ucw.cz> wrote:
> On Mon 2018-02-19 16:41:35, Daniel Vetter wrote:
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

Look, if this causes just one conflict down the line because it touches
the kernel all over the place, then IMO it already wasn't worth
it. Merge conflicts are inevitable, but there's no reason to make life
harder just to cater for a cleanup patch. It's not that important.

Had it been split up, the drm parts would've been merged already.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Technology Center
