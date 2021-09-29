Return-Path: <SRS0=cQ7c=OT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D6CC433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Sep 2021 16:30:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 162ED61462
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Sep 2021 16:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 162ED61462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41R6HqtHOZBJak2vwD/bKjQ+Ofc+eAkiuT6ScgJC8y8=; b=MGLBrJ8WdpJcuO5uD7ycsLXd/6
	kbCpRDsN/wwSSS4cCIrYmk8n/Z1AsUfUXSPZhxa5+g0SkEHx/foKaTFI1E/kWWj/ENuUMIhXMz/wp
	KbZtkUPDMzca4Vv6D9QfBw1rD+drY5N3GzrM75P1gl+O1kihLFv7pJrFPJGEpWPg62FlfgZLgaRkA
	e3qxZ+WeSecUWUovRjiaDhLlFzj7cn3u1kGm0Co/CxxuuTZvBVoopGvolbgdobpXxSVybrhAXvqVB
	Ckk2zfVNjIt2cKeVVTo+/Dg9jKfat7U4SeZ2b58xTRLdQVsuALwO4oylLVKvJ59ftB50vg17Dt54h
	4AV0f21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVcTK-00Bovf-IY; Wed, 29 Sep 2021 16:30:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVcTH-00BouM-KX
 for linux-snps-arc@lists.infradead.org; Wed, 29 Sep 2021 16:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632933014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LzEA/AMsDC+zBVogDRmix14O9ZRH28vVpD1t8BFMOTQ=;
 b=OHBmXcXFal572r+La62x/Pn62V3aPieYOB7wpdnX+fdQtLC0NoStUv+jiupRblcNaL3ueG
 KAyzB/qmCFYPkPzJ99/RNGLkOgQmgI6ENjA0Hl59ZGewjTj0IjWYZ6sXmWRuGDsqkZZI1A
 WaMksgp254vi7iOLDxJkYraotUwtBZw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-3awsB1wVPw-uZXrOB1NzyA-1; Wed, 29 Sep 2021 12:30:12 -0400
X-MC-Unique: 3awsB1wVPw-uZXrOB1NzyA-1
Received: by mail-wr1-f71.google.com with SMTP id
 z15-20020adfec8f000000b001606a799300so804119wrn.19
 for <linux-snps-arc@lists.infradead.org>; Wed, 29 Sep 2021 09:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LzEA/AMsDC+zBVogDRmix14O9ZRH28vVpD1t8BFMOTQ=;
 b=SRlosQo0EP75VhB1yKw8M4PDsWUP8IvPqpQy46AHsPZXFt4DKdrBIIZKS4y4QfxU0P
 PkfmPf7r/U6+6IWDivsLKrXsPrPeZj1gHHFL4po8df4uBxxHLzoHvREsmhzDo/533k/d
 yDWVGLXK6K56ekW/0rajZU1MADrZjBup9Lf2+8RQYUwJNgFly2eTUWvF5jGv62n1EkfX
 sYDsxS704EnNYHeeEg5RJNmdNHMtgl2nEDLHci/1t+7ZrX/1LZxJuH+oqIKvHFR+CROq
 64ghav2GRYvi4W7581ym6v9LIa2o3LQq4qV0Wk5QvUtTtiQX4XIuQceA+DsOhpehISkQ
 GQmw==
X-Gm-Message-State: AOAM533u2VosB3Kvw7pfWGNi2LbLzb8GLsNBoAlteeCMFKvn8VpCUlX9
 kLMWCBLLxaEqNBFYIVZArN/3Q+Yaaao9+dbbhDyTvyFmgfx+nnV/kz1tEijQ+Xt3lHvfDpOfEe7
 AnjBgK6XLMTr+B/+v4eIofS8LTE6FpVja
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr1026256wri.150.1632933011561; 
 Wed, 29 Sep 2021 09:30:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWpbhPpbSmBcJNqivlDLJZ/UTUefLQTk4gKa/CcEn6HHHOoDfx1bOgZbQtRoI/dHj6OAlJWg==
X-Received: by 2002:a05:6000:184c:: with SMTP id
 c12mr1026220wri.150.1632933011388; 
 Wed, 29 Sep 2021 09:30:11 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
 by smtp.gmail.com with ESMTPSA id
 m21sm354405wmq.37.2021.09.29.09.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 09:30:10 -0700 (PDT)
Subject: Re: [PATCH v1 2/4] memblock: allow to specify flags with
 memblock_add_node()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>,
 Jianyong Wu <Jianyong.Wu@arm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-3-david@redhat.com> <YVSTkGdh2nQWQp+U@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <3651c7d0-f7b6-63ff-216a-b74176623a6f@redhat.com>
Date: Wed, 29 Sep 2021 18:30:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVSTkGdh2nQWQp+U@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_093015_790024_68F2A321 
X-CRM114-Status: GOOD (  19.57  )
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

On 29.09.21 18:25, Mike Rapoport wrote:
> On Mon, Sep 27, 2021 at 05:05:16PM +0200, David Hildenbrand wrote:
>> We want to specify flags when hotplugging memory. Let's prepare to pass
>> flags to memblock_add_node() by adjusting all existing users.
>>
>> Note that when hotplugging memory the system is already up and running
>> and we don't want to add the memory first and apply flags later: it
>> should happen within one memblock call.
> 
> Why is it important that the system is up and why it should happen in a
> single call?
> I don't mind adding flags parameter to memblock_add_node() but this
> changelog does not really explain the reasons to do it.

"After memblock_add_node(), we could race with anybody performing a 
search for MEMBLOCK_NONE, like kexec_file -- and that only happens once 
the system is already up and running. So we want both steps to happen 
atomically."

I can add that to the patch description.

(I think it still won't be completely atomic because memblock isn't 
properly implementing locking yet, but that's a different story)

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
