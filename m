Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFDCC61DB3
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Jan 2023 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITiURmjQhMUIgygNqGKw3aarnLZJar7KLIQ4WnrPoDM=; b=q+sITvYXfyN1x0
	1GGG9wb2EvsURaUEPf8k8Vxu3TOUvXGG+GcsND6iS58RW4+MNXkaKFgzSwS+O1SvzVt55sm4IecnV
	svk222HQ9ypTUn4d3ZhLrcFvVrf//RM4aA1Fm/MMGgeyhh+R9qsgKf9e1UVrI4rk7fX/DN61ibRo8
	KBWsM48p7+S4LT3sY2CWgYpBkHGsMhrEwiWK/EBT8GLCyYGmWyYiyj8Q1ikbW9P3+tgqLBQISxqri
	p0nBnhZzGtDw27WUX6go2Crk8pfsEBMZWnHdKithDQB6kNIOvX7Ks8vpeeKzLutDznVh268+J8uYE
	MKCGw/v6CXH6blN5AXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExPR-003VLa-T0; Mon, 09 Jan 2023 19:02:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExOl-003V3y-R0
	for linux-snps-arc@lists.infradead.org; Mon, 09 Jan 2023 19:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673290890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bU+svoPcyEEDaWYmIcNec69dTXz5hTgyu3b7xJNjXUQ=;
	b=NOt/j2pQ30uerawH0+X7lv3BSG0Q3QRQQsO+laAminXxtRnPi2sg78vn5sD1X5W/JQZ/wk
	0vrdhSxMdz6Zkf0FkB6B+1pfrxT5KiIVObpRjx1suFyhCq2iSKh8FGm7ldA2B781ExMm/g
	46U0I+4WWQwnC0hmBH36ZGXRSz6BK1c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-4t4PHCWUOLm6oPy1W1QiFw-1; Mon, 09 Jan 2023 14:01:28 -0500
X-MC-Unique: 4t4PHCWUOLm6oPy1W1QiFw-1
Received: by mail-qt1-f199.google.com with SMTP id a13-20020ac8610d000000b003a8151cadebso4289378qtm.10
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Jan 2023 11:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU+svoPcyEEDaWYmIcNec69dTXz5hTgyu3b7xJNjXUQ=;
        b=tNY2m+58iQp/4bOAdWBiKjtwB4br/IYCtApPyNDwayPQZmvBJDRBVXhCz5H1j5+/9Q
         d9RVrdqrfQnCxoynfsLybpLKngBgI1fD/uookGV67oJGHfPEqfWoicdqARHQwZXMy1Ip
         AApEXgKVqxnQBNIpAXq3vOvdXzuP2Skh4cSh3c8FRWb4mExYXMopHPl8VLAj9GSiI0m1
         fGNIIt71rEz9n8MJX6AUmVO+JKMhyNt/ehlEJ8gNzyOeLKHGRi4OUe6/EnDLPx9WyN7g
         OhWjeWu8jwPI5mAm5ugbckkMeJzrvXbhnz5AO/2YnMQzJ2OFCCqcz9YMtYvpbJmol+Ug
         meLA==
X-Gm-Message-State: AFqh2krEGhK/YDFgK6yC1ieckDBSABpardVhvC4Fkrmz/n6UR5eOrx51
	hkLVpZEcgI111ymfScsZZLB6quMGHp8jFGjKhfarbc252KmkWabT1ZOTvvzEJ6c9Opwh52DrHjE
	fByi1dAFaYFKs7y4sHI40TZBA94KbRWOn
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr91336706qtp.7.1673290888079;
        Mon, 09 Jan 2023 11:01:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseRLv5+JCaBFPqzT7E7Yv2YOrloRSyhYUUSWRG6zA8srvH9gyrV5oV35teC9nwwkDxbanAYA==
X-Received: by 2002:ac8:7395:0:b0:3a7:ed31:a618 with SMTP id t21-20020ac87395000000b003a7ed31a618mr91336646qtp.7.1673290887764;
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id cj12-20020a05622a258c00b0039cc0fbdb61sm4985479qtb.53.2023.01.09.11.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:01:27 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, Guo Ren
 <guoren@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, "David
 S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 6/8] treewide: Trace IPIs sent via smp_send_reschedule()
In-Reply-To: <CAAhV-H6Oii6t-4aHFjgPkCgFAd+LcVVg+7jMu_w4mEa0Ecuwaw@mail.gmail.com>
References: <20221202155817.2102944-1-vschneid@redhat.com>
 <20221202155817.2102944-7-vschneid@redhat.com>
 <CAAhV-H6Oii6t-4aHFjgPkCgFAd+LcVVg+7jMu_w4mEa0Ecuwaw@mail.gmail.com>
Date: Mon, 09 Jan 2023 19:01:22 +0000
Message-ID: <xhsmh5ydfedml.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_110132_432924_7DBC3392 
X-CRM114-Status: GOOD (  12.02  )
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

On 08/01/23 20:17, Huacai Chen wrote:
> Hi, Valentin,
>
> On Fri, Dec 2, 2022 at 11:59 PM Valentin Schneider <vschneid@redhat.com> wrote:
>> @@ -83,7 +83,7 @@ extern void show_ipi_list(struct seq_file *p, int prec);
>>   * it goes straight through and wastes no time serializing
>>   * anything. Worst case is that we lose a reschedule ...
>>   */
>> -static inline void smp_send_reschedule(int cpu)
>> +static inline void arch_smp_send_reschedule(int cpu)
>>  {
>>         loongson_send_ipi_single(cpu, SMP_RESCHEDULE);
>>  }
> This function has been moved to arch/loongarch/kernel/smp.c since 6.2.
>

Thanks! I'll make sure to rerun the coccinelle script for the next version.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
