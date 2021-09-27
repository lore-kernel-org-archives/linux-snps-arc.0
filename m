Return-Path: <SRS0=q9SV=OR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A7EC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Sep 2021 15:07:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9212E604D1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Sep 2021 15:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9212E604D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGFq1qjw1N8bc3o1lZyItMnUUcWXUUMWw2HPXt6evpg=; b=SAVqS6UibwnEXL/qj/YH0j7wye
	X24sxb2ShBMgpZLNmuME+CgVI0mJSkwzWXWcY8sncuOxh5PRwkilTuH//pFYCr+GvwRWvJH8adaT7
	Jj/D+zTHs6wGES0xnZJK4gDp44DyQL2VXDD71L/EoP0k8UrdpbdhD4+2mzMt8pxoIUiJj5JWCM6pF
	JE1eMF5zpZZF5EGyf0d2WNmdEO5zX+/KSIFmbLxdZPDELebOvoShN4t27Gw7wV2p82uVkVZPQdGjM
	8T8GoMhoO8wU7LX6ldsAr63Wl33PwKjb0JIW+yDzuqmC3k0Y64GAwFp/m7edVkmkdI8L8zd80ZKwd
	ftdy+pcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUsE6-0032Wa-1J; Mon, 27 Sep 2021 15:07:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUsDm-0032MI-Gj
 for linux-snps-arc@lists.infradead.org; Mon, 27 Sep 2021 15:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632755229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H2YLjPWLjDxhksfVJJ0b+TgzS3sQ4uenpZKkXE6cLl8=;
 b=CI15DFoi3XIG0fxC6HpZG6pyA5oOq6qQXCz1annlYGBip6XeSk3NzkehCeJlkzIkUi9HGp
 JDcV5pFdkBEuUcerEwDz3JZ5DoIiqTJVuoHHYcaxm44gG0wNw9H+alFQ/KH92Dy02qiHGf
 hH+5RU37+2Zm/nE7Bm8V1SMkSENNy4U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-74yIZwwJM265ZKxqTMRvOA-1; Mon, 27 Sep 2021 11:07:06 -0400
X-MC-Unique: 74yIZwwJM265ZKxqTMRvOA-1
Received: by mail-wr1-f71.google.com with SMTP id
 w2-20020a5d5442000000b0016061c95fb7so3475635wrv.12
 for <linux-snps-arc@lists.infradead.org>; Mon, 27 Sep 2021 08:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=H2YLjPWLjDxhksfVJJ0b+TgzS3sQ4uenpZKkXE6cLl8=;
 b=3Z2Ux2wTPrklmLerXbzSeNxqX3D6IhSaOdkFmICu8gnr8KvImFaVjDQVJBWNXJc4Xh
 o2mmG4Wa2vIDiJZRvvH2loF1jUk6z7euK7XaHqraJdQKqH00laJR7TPCUx5yVM911Qsg
 jfiNtgCzf0eXNvsMqBXKsird5vAeZG8miVTqj3c+NMWzxQt8jhVAxytlWquHa+KkrNNd
 wdYR5RApGLdVhJn+lGJwiO0whp/Z20feyL+lfBJtvyxNnNGS+7yPlScw3LCoYknOMeQ6
 gUcEPIiqCgq46ydMVM/Sck8tFuZBP0Jao++8f5L7xV+xiuxelsErpVHx2tZ9DuPCYrZp
 wbyg==
X-Gm-Message-State: AOAM531mjVTZgFGT2PXHjdiqFek3i4SuuN0/w8mr/Mw1LHfpOZpShbWo
 +6j9mAaMyS5hv0E0vao+ZXd+YNI2+G9KvTXiX69pcXzbnm9vEcqCe5OGtC0vFfFCROAb8N/Uxtf
 cTU7atM2h3mzQYxbx8rbY8zBdNZccl4rF
X-Received: by 2002:a5d:590a:: with SMTP id v10mr361566wrd.87.1632755224888;
 Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy5wlKXLyU5BWf9WD/reu/rSzNLdsCLGLJ2WCZuEX7Xkvd9O/Z0HH1Erkz7+dZr/KU55FrDA==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr361519wrd.87.1632755224672;
 Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c654d.dip0.t-ipconnect.de. [91.12.101.77])
 by smtp.gmail.com with ESMTPSA id f9sm284908wmf.3.2021.09.27.08.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 08:07:04 -0700 (PDT)
Subject: Re: [PATCH v1 0/4] mm/memory_hotplug: full support for
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport
 <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
 Oscar Salvador <osalvador@suse.de>, Jianyong Wu <Jianyong.Wu@arm.com>,
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <d7d4ec92-7b9c-f466-6d3c-cfdd162d1dbf@redhat.com>
Date: Mon, 27 Sep 2021 17:07:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927150518.8607-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_080710_661036_B2A92EF8 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

Intended subject was "[PATCH v1 0/4] mm/memory_hotplug: full support for 
add_memory_driver_managed() with CONFIG_ARCH_KEEP_MEMBLOCK"

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
