Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2115C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jun 2022 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GuzpLKK3VuhwyP7xH0jwydQLgjWUZibyCvo98IO/dzw=; b=HklZNxmYcDXZz6
	ibmKTuwngeqzoQNb3ZudKaEiux0ahCOL3b4dgSOwdp8EUztoEYWa8JgoTNkRg9EINmMCKQb1va6G1
	Ro/YixIhVmgCA3mbCgYAFxC0pSeUaLq9WdD+ug9xrXhwV+P60IfWBaiTz020oILswuzjdUa2ptYa8
	acMD8r189Ujh3INenWkX+u3SP3l2yHUSEuYlwMr7GHRwhUyPs+p5sPrYZwedpXeqYwW8ZXsHQ5Lit
	SQIYxycgg0MG/O0m62m9pWZvGvogyqD2ywZ5yd/uN7TyFA7d5/uPzYPEmmQSt9S4OAVfcoBaK3EDn
	YEqSU8eIACQKpoS224Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19yT-00AWRf-SN; Tue, 14 Jun 2022 17:05:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19yQ-00AWPt-T0
	for linux-snps-arc@lists.infradead.org; Tue, 14 Jun 2022 17:05:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id o7so18435937eja.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Jun 2022 10:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=8kL31sq09D8Sa9IPjOlG/EUdwJHYr7hqIWtqek4V37I=;
        b=gaszsaxT7y8DZaogxGvwz74Dd48w/Cp0hg+3ZEm9rSthwUwg0LUknbbmfD8+Q5SgAz
         oVeNuykUOOUDIksq0j1fkgcnyYwmp3x1w4IEubQaokwhxCysTPAWewSsIfGl4PMRI68K
         /5+y1aztJKLQTozQrme3GUMNPZYJ2CBvhmBpyweD/evGOF6/YANp8Wk1VBmz5sObc8nK
         JYqT/TVjshep9bL619phFLLyYBghlf6mLZMCyAtcl9+eT5IVPSd2eALashyjU5KRNUnV
         UqyrTSw4IjvC6g/JY0H7ucpY/CLONPStGYU6nrqyknQIzFQGTw9qwZ2qUK+wchNAbp9u
         rjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=8kL31sq09D8Sa9IPjOlG/EUdwJHYr7hqIWtqek4V37I=;
        b=WDJInY8uj7xYI5KVX8EtrSuXjsgVbK/fBAtLgt3NMXn6ReL1g+6vxoy5TGgqEKFqMb
         mqoVtToX51NutKzqcwEntbcbxXdMRn7wqQrSQJ+WYLab7OG+8IZ5xbNLtBOeYCoZmizA
         8VI2rj2H/FamCHhyeTsQCqzl2PIOvoGzFY0UcN0zBmCjYFcvonEikBw+1U/4mCiA9GoP
         jlmEGZmHLz9JTu5bg+a27DqRHq1kTin9y443p8DBPuUcrUBEx0UM3iDGErZrY/P1AQAt
         i+VyMiLyr5VytRGAkkMwvbkt+9zUhEhbW4xeYt7Wmn7M437n/7/i6RugaxRwQa2jFnmi
         8YvA==
X-Gm-Message-State: AOAM5322NV+vIJMvu6kbBw3HoA5TGPQPqJwf3n8bBmQeQX2XXK0ePeay
	P8Pyp5cOr/aKRrUgJgRDZLRcQw==
X-Google-Smtp-Source: ABdhPJwVZtUjvG9CPUhhM7got9HvwnOjmKdt5doxba25L2l9an3tpx2JhQIYSso0MgPUejnQ1/u8mw==
X-Received: by 2002:a17:906:fb0f:b0:715:7e23:bbbc with SMTP id lz15-20020a170906fb0f00b007157e23bbbcmr5194439ejb.373.1655226300366;
        Tue, 14 Jun 2022 10:05:00 -0700 (PDT)
Received: from [10.1.0.138] (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
        by smtp.gmail.com with ESMTPSA id vr7-20020a170906bfe700b00706c50870a0sm5246559ejb.194.2022.06.14.10.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 10:04:59 -0700 (PDT)
Message-ID: <b38adc9a-7310-2fd7-2124-79942812797c@mind.be>
Date: Tue, 14 Jun 2022 19:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Buildroot] [PATCH] package/bpftool: add a patch to fix cross
 compilation
Content-Language: en-GB
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
References: <48ac54a1-f946-8f98-42e4-e39d2ab7130d@synopsys.com>
 <6592891c-1b2d-d1cb-f34b-3e96f23e74cb@mind.be>
 <fcddbfa3-9d7a-e809-630c-b157b5d6c8bf@synopsys.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <fcddbfa3-9d7a-e809-630c-b157b5d6c8bf@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_100502_983961_70B50B0F 
X-CRM114-Status: GOOD (  24.42  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 13/06/2022 22:48, Shahab Vahedi wrote:
> Arnout,
> 
> On 6/13/22 22:21, Arnout Vandecappelle wrote:
>>> The patch file should be git-formatted and have your Signed-off-by.
>> I simply took the patch from [1] (which has your signoff) and added
>> the additional Makefile.include changes
> 
> Thanks for the tweak. I overlooked the "Sign-off" part. I used "diff"
> because of what BR's manual suggests [1]:
> 
>    If the software is under version control, it is recommended to use
>    the upstream SCM software to generate the patch set.
> 
>    Otherwise, concatenate the header with the output of the
>    diff -purN ...
> 
> The proposed patch was made for a tar ball release that is not under
> any version control per se. With the hindsight, maybe I should have
> checked for "v6.8.0" as branch/tag in upstream repo.

  Yeah, bpftool is actually a special situation since the real upstream (where 
you contributed your patch) is a separate repository that gets regularly synced 
into the bpftool repo. I think that at the time you sent this to Buildroot, it 
was not yet synced to bpftool.

>> (of which I don't really understand BTW why they're relevant for Buildroot).
> 
> That extra change (setting "HOSTAR") is necessary, because in upstream
> that was already taken care of before the patch submission. However, in
> v6.8.0 release "HOSTAR" is never initialised and the fix is actually
> using it.

  Since we set it from the .mk file, it doesn't actually *need* to be 
initialized in Buildroot context.

  Also, if that came from a previously applied upstream patch, it's better to 
backport the actual upstream patch. But that can be complicated as well for 
something like bpftool, so it's fully understandable to do it like this. It 
would be nice however in such a case to add a reference to the upstream commit 
that added it.

  Regards,
  Arnout

> 
> [1]
> https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
> 
> 
> Cheers,
> Shahab

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
