Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3A6C77B78
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 May 2023 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3W9jpUxDLZ9HZAF4Qa/UbIM4STjCWFvLSiv9Lw3Usc=; b=P0yS9MujqwN8A3
	K7tnzyKDsC53OMXgzQ2ytQBiW5wLO7y/6exrFld5uDmmnZjivDTYFPuPCP3hHH80m5LYoiux8iRks
	+W3FiRZNIuShVd9LdNmaAyIsZxLNnpHBCnaYtbA0lE9OKBF10O+zCdlM4WhRr1XxiHC3sdMeCgMSW
	Tf7EM8NQTeY3tbhSmlnVPs3UW6rn85zVobDeGwHvj/AOmL7dmxrXJjNV/1mjlkKEpyE9W3iEvKPP4
	BwSECCGmQ2Pq6nMJJlCKeUt22fMJlcnVKF6LssgO1VfDSA+AO3pJ4baQ6zbgUMgEU/w5v87MAH60X
	J3N8j39d6ijgf0zpgmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu6lw-003dCx-1g;
	Wed, 03 May 2023 07:19:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu6lt-003dBa-0z
	for linux-snps-arc@lists.infradead.org;
	Wed, 03 May 2023 07:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683098366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JWuwBsoA7E+ixFPnuQyU62/zGQyUSXimh/xtxQzzOds=;
	b=Yih/rFJAHiaY8DcTzymU86MuRim2k6zUA0W3Eysk7pU/42d2CSiANyDtU2oEPKsW0GHeeu
	9yQVvzZO/+sXgBHFGSwqBiTV/l9uzH8CfUb6mbArG+Vng9CT49t7qBA973Gp2SvERKGl7X
	Q+knl9oug8drqKei940PcigipRUFEgU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-JbWeY_xMPcuT2ryqI0GxhA-1; Wed, 03 May 2023 03:19:24 -0400
X-MC-Unique: JbWeY_xMPcuT2ryqI0GxhA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f18c2b2110so14861725e9.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 03 May 2023 00:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683098363; x=1685690363;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWuwBsoA7E+ixFPnuQyU62/zGQyUSXimh/xtxQzzOds=;
        b=f3PS943sUMjw+885hzXe38CkDMUcKMFPC8ZDeJPSz4IgTPhrWaZV6oJhs3HVMAnO5M
         NqV0dLmzvafkOONJ4dr1Elcy+RoioJa+H2XOOCULecWDkOysaToqdkZcNqG1iRPggOiX
         c8XcqyQve2lJTODxts7rZqlCNVThLW9J2Ob3oTPgNalR8y3aeVUaHQOGO17U1Xdua22U
         U3KsVPW3Lr2owC69/p4CG+wVr+1zEJQsQwg3Z7j2h7CBntjKJDJA6NKNaqQ/uo8cXolH
         YLxvj6pnQwsY7VlBq8UJ+c8faN3iHzore1ku2FRdwuznMWb3GYit0bKB4bDEwj2s+Uqo
         ASfg==
X-Gm-Message-State: AC+VfDwhZpCQKPpOxXr/MgqUGCJkNtC+g02USaTa2JByVcsm3N4EjU+O
	rspA1C7Q7bN7U0j+atXmPmpQpv14ekg21vZdgvvm70ttZznxrPVPqjQugI7tI9WmEz1pbVFzj0w
	NTpbfUL+5Q2DySVt0xAcTl+sWwYRcLAfn
X-Received: by 2002:a5d:4536:0:b0:2f9:4fe9:74de with SMTP id j22-20020a5d4536000000b002f94fe974demr14583297wra.16.1683098363277;
        Wed, 03 May 2023 00:19:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4YmDJ5fSjEX9bYJcvGxxrKGNEefuG/olEhGMwhxvTP6ZpCZhJEgcZLb8yFcLBX87Q12Wuhlg==
X-Received: by 2002:a5d:4536:0:b0:2f9:4fe9:74de with SMTP id j22-20020a5d4536000000b002f94fe974demr14583271wra.16.1683098363001;
        Wed, 03 May 2023 00:19:23 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d5147000000b002cde25fba30sm33050954wrt.1.2023.05.03.00.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 00:19:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, arnd@arndb.de,
 deller@gmx.de, chenhuacai@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
 linux-parisc@vger.kernel.org, vgupta@kernel.org,
 sparclinux@vger.kernel.org, kernel@xen0n.name,
 linux-snps-arc@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/6] fbdev: Include <linux/io.h> via <asm/fb.h>
In-Reply-To: <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
References: <20230502130223.14719-1-tzimmermann@suse.de>
 <20230502130223.14719-5-tzimmermann@suse.de>
 <20230502195429.GA319489@ravnborg.org>
 <563673c0-799d-e353-974c-91b1ab881a22@suse.de>
Date: Wed, 03 May 2023 09:19:21 +0200
Message-ID: <87354dyj9i.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_001929_440406_D96CC656 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Am 02.05.23 um 21:54 schrieb Sam Ravnborg:
>> On Tue, May 02, 2023 at 03:02:21PM +0200, Thomas Zimmermann wrote:

[...]

>>>   #include <linux/console.h> /* Why should fb driver call console functions? because console_lock() */
>>>   #include <video/vga.h>
>>>   
>>> +#include <asm/fb.h>
>> 
>> When we have a header like linux/fb.h - it is my understanding that it is
>> preferred to include that file, and not the asm/fb.h variant.
>> 
>> This is assuming the linux/fb.h contains the generic stuff, and includes
>> asm/fb.h for the architecture specific parts.
>> 
>> So drivers will include linux/fb.h and then they automatically get the
>> architecture specific parts from asm/fb.h.
>> 
>> In other words, drivers are not supposed to include asm/fb.h, if
>> linux.fb.h exists - and linux/fb.h shall include the asm/fb.h.
>> 
>> If the above holds true, then it is wrong and not needed to add asm/fb.h
>> as seen above.
>> 
>> 
>> There are countless examples where the above are not followed,
>> but to my best understanding the above it the preferred way to do it.
>
> Where did youher this? I only know about this in the case of asm/io.h 
> vs. linux/io.h.
>

I understand that's the case too. I believe even checkpatch.pl complains
about it? (not that the script always get right, but just as an example).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
