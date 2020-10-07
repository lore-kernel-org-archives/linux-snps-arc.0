Return-Path: <SRS0=Y6oE=DO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9BAC4363C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2020 04:09:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A65208C3
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2020 04:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SwtaTuMM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGyHcqbs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A65208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=amsat.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Q+2BUaHdMZbHnrOd5GZjtJYiPTmFOBV2EHxMVlcl44=; b=SwtaTuMMqd8V7Gxk6klCiBcNv
	NLTB0UjRP6dCU+KI248owBm90ZouOh+637DCv/o6ELeiaHs0GEuHsPLtQAGlOczHHkyQFKFNJpBVS
	ltb2hTOtWXijNdQNUpuouQbcwAtIE9/HAglSGNg0FdH8NPzUoSZyQE3r6LNSYNIyQcnjwYpUyWyXL
	SbUlcu2nATunR+F1UWDy8RnVidcHJ8swcBDWbkQItDCgBkpszrotjtnyHxv3dOhoIeOYJ8rE4fL7E
	A8SpGr1bsVtxrbbf+sle9JcXTRMayRHWCpmDofbNggaIu2Iy8IUqQBAU1ml5TxJLyCRL3gbAfz+Cw
	Q1lAtU+7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ0lH-000119-76; Wed, 07 Oct 2020 04:09:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ0lD-00010p-IG
 for linux-snps-arc@lists.infradead.org; Wed, 07 Oct 2020 04:09:05 +0000
Received: by mail-wm1-x341.google.com with SMTP id z22so3555350wmi.0
 for <linux-snps-arc@lists.infradead.org>; Tue, 06 Oct 2020 21:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TT1TUmO44LCjCtXHOLpqxj04IhS53zSYbviDkOeqULc=;
 b=tGyHcqbsEBWk5HfIgcuftuRyR9ohP58hdlDMFS0c2TRdEwDRuDlgFnI7tHDIJ9MKBj
 FwzfkPWsrYgmD8OK5YS3jgEUDzbLeTa2R6MO8ltvKHRVgpu+kIjm1NvSFNjYRA5AYGCX
 /R/o4IKSaxpxP8USV8WC04gK8m9NPc5SYjhNhu7wsJsX3Rj78c7q8IDA18bN6s0HHxlj
 MP0kFqwfJod8xbxXtIQL1ohGtO0eixK8s3IfQ4MyasJClhH1ib5sQ3M+/TZF0nqsNHua
 uBMTL3Buh8xfRQ9EncmZ4Apk/Psy0ZZFuU7YFFFhIFBqSN5e7YuWELAPiCDFd2QqdKPp
 sa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TT1TUmO44LCjCtXHOLpqxj04IhS53zSYbviDkOeqULc=;
 b=M8VVivTnbRd/omDU3AwwA9tL3K2Uzwm8Zdhi0kMfsWzXgKcjvY9WmA4Oco3NL9rPKV
 ouCCsissVarZLyFQq4c5IrgkATzYxZiew7H4dc4c87p68R2jULkVE1vseMDw5hJsrHPe
 WP4e4dtE0r3pFpJioRIqHgWRS3Lws2dLGDv4IuxuAPkBq66Y94pu0cxpeyzOmDOt0jTn
 X9E+k34aLr/7sT8ESYLI5fAN9Ov/UTp4TdMdRhp2DuMRhQfBRvwbJznPf9A5fcZqZEbS
 lY6ulVrPQvLScU+bE050i4KuBEh15n3ZdWsvhiOOafxZ/84rB3Iu+OfEwAdVmNWyDkqB
 KDJw==
X-Gm-Message-State: AOAM5314PlYY+u0ZfVyHtWolrJmFfUD4cLPvt53Yd4IrifpUvVe78HHh
 1Pm/J6N+hFE9eusPH2LUo8E6My4g1XE=
X-Google-Smtp-Source: ABdhPJzBCXa3qbFu/pUK8rbFs83y9ZK2zy09kxcEqpqRao4H/HMbp3ROoYlfAoZDMSwV1HyibYcYaQ==
X-Received: by 2002:a1c:2108:: with SMTP id h8mr1000918wmh.63.1602043740560;
 Tue, 06 Oct 2020 21:09:00 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id 4sm1019486wrn.48.2020.10.06.21.08.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 21:08:59 -0700 (PDT)
Subject: Re: [PATCH 01/14] arc: Add initial core cpu files
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20200930204604.20663-1-cupertinomiranda@gmail.com>
 <20200930204604.20663-2-cupertinomiranda@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ec923290-b6a1-00ab-030b-21676a36dae3@amsat.org>
Date: Wed, 7 Oct 2020 06:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930204604.20663-2-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_000903_641152_8FEBA91B 
X-CRM114-Status: GOOD (  25.59  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Cupertino,

On 9/30/20 10:45 PM, cupertinomiranda@gmail.com wrote:
> From: Cupertino Miranda <cmiranda@synopsys.com>
> 
> Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
> ---
...

> diff --git a/target/arc/Makefile.objs b/target/arc/Makefile.objs
> new file mode 100644
> index 0000000000..7b2afd08e4
> --- /dev/null
> +++ b/target/arc/Makefile.objs
> @@ -0,0 +1,34 @@
> +#
> +#  QEMU ARC CPU
> +#
> +#  Copyright (c) 2020
> +#
> +#  This library is free software; you can redistribute it and/or
> +#  modify it under the terms of the GNU Lesser General Public
> +#  License as published by the Free Software Foundation; either
> +#  version 2.1 of the License, or (at your option) any later version.
> +#
> +#  This library is distributed in the hope that it will be useful,
> +#  but WITHOUT ANY WARRANTY; without even the implied warranty of
> +#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +#  Lesser General Public License for more details.
> +#
> +#  You should have received a copy of the GNU Lesser General Public
> +#  License along with this library; if not, see
> +#  <http://www.gnu.org/licenses/lgpl-2.1.html>
> +#
> +
> +obj-y   += translate.o
> +obj-y   += helper.o
> +obj-y   += cpu.o
> +obj-y   += op_helper.o
> +obj-y   += gdbstub.o
> +obj-y   += decoder.o
> +obj-y   += regs.o
> +obj-y   += semfunc.o
> +obj-y   += semfunc-helper.o
> +obj-y   += mmu.o
> +obj-y   += mpu.o
> +obj-y   += timer.o
> +obj-y   += irq.o
> +obj-y   += cache.o

We don't use Makefiles anymore, and you already provides meson.build.

> diff --git a/target/arc/arc-common.h b/target/arc/arc-common.h
> new file mode 100644
> index 0000000000..8013e1d2ed
> --- /dev/null
> +++ b/target/arc/arc-common.h
> @@ -0,0 +1,55 @@
> +/*
> + *  Common header file to be used by cpu and disassembler.
> + *  Copyright (C) 2017 Free Software Foundation, Inc.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with GAS or GDB; see the file COPYING3. If not, write to
> + *  the Free Software Foundation, 51 Franklin Street - Fifth Floor, Boston,
> + *  MA 02110-1301, USA.
> + */
> +
> +#ifndef ARC_COMMON_H
> +#define ARC_COMMON_H
> +
> +#include "qemu/osdep.h"
...

Do not include "qemu/osdep.h" in headers.

> +/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
> +/* vim: set ts=4 sw=4 et: */
> diff --git a/target/arc/cpu-qom.h b/target/arc/cpu-qom.h
> new file mode 100644
> index 0000000000..413b693558
> --- /dev/null
> +++ b/target/arc/cpu-qom.h
> @@ -0,0 +1,53 @@
> +/*
> + * QEMU ARC CPU
> + *
> + * Copyright (c) 2016 Michael Rolnik

???

> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * <http://www.gnu.org/licenses/lgpl-2.1.html>
> + */
> +
...

> diff --git a/target/arc/cpu.c b/target/arc/cpu.c
> new file mode 100644
> index 0000000000..bbcb371760
> --- /dev/null
> +++ b/target/arc/cpu.c
> @@ -0,0 +1,468 @@
> +/*
> + * QEMU ARC CPU
> + *
> + * Copyright (c) 2020

(c) Synopsys?

> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see
> + * http://www.gnu.org/licenses/lgpl-2.1.html
> + */
...

> +/*-*-indent-tabs-mode:nil;tab-width:4;indent-line-function:'insert-tab'-*-*/
> +/* vim: set ts=4 sw=4 et: */
> diff --git a/target/arc/cpu.h b/target/arc/cpu.h
> new file mode 100644
> index 0000000000..e8446366e5
> --- /dev/null
> +++ b/target/arc/cpu.h
> @@ -0,0 +1,532 @@
> + /*
> +  * QEMU ARC CPU
> +  *
> +  * Copyright (c) 2020

Again.

> +  *
> +  * This library is free software; you can redistribute it and/or
> +  * modify it under the terms of the GNU Lesser General Public
> +  * License as published by the Free Software Foundation; either
> +  * version 2.1 of the License, or (at your option) any later version.
> +  *
> +  * This library is distributed in the hope that it will be useful,
> +  * but WITHOUT ANY WARRANTY; without even the implied warranty of
> +  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +  * Lesser General Public License for more details.
> +  *
> +  * You should have received a copy of the GNU Lesser General Public
> +  * License along with this library; if not, see
> +  * <http://www.gnu.org/licenses/lgpl-2.1.html>
> +  */
> +
> +#ifndef CPU_ARC_H
> +#define CPU_ARC_H
> +
...

> +
> +/*
> + * ArcCPU:
> + * @env: #CPUMBState
> + *
> + * An ARC CPU.
> + */
> +struct ARCCPU {
> +  /*< private >*/
> +  CPUState parent_obj;
> +
> +  /*< public >*/
> +
> +  /* ARC Configuration Settings. */
> +  struct {
> +    uint32_t addr_size;
> +    bool     aps_feature;
> +    bool     byte_order;
> +    bool     bitscan_option;
> +    uint32_t br_bc_entries;
> +    uint32_t br_pt_entries;
> +    bool     br_bc_full_tag;
> +    uint8_t  br_rs_entries;
> +    uint32_t br_bc_tag_size;
> +    uint8_t  br_tosq_entries;
> +    uint8_t  br_fb_entries;
> +    bool     code_density;
> +    bool     code_protect;
> +    uint8_t  dccm_mem_cycles;
> +    bool     dccm_posedge;
> +    uint8_t  dccm_mem_bancks;
> +    uint8_t  dc_mem_cycles;
> +    bool     dc_posedge;
> +    bool     dmp_unaligned;
> +    bool     ecc_exception;
> +    uint32_t external_interrupts;
> +    uint8_t  ecc_option;
> +    bool     firq_option;
> +    bool     fpu_dp_option;
> +    bool     fpu_fma_option;
> +    bool     fpu_div_option;
> +    bool     has_actionpoints;
> +    bool     has_fpu;
> +    bool     has_interrupts;
> +    bool     has_mmu;
> +    bool     has_mpu;
> +    bool     has_timer_0;
> +    bool     has_timer_1;
> +    bool     has_pct;
> +    bool     has_rtt;
> +    bool     has_smart;
> +    uint32_t intvbase_preset;
> +    uint32_t lpc_size;
> +    uint8_t  mpu_num_regions;
> +    uint8_t  mpy_option;
> +    uint32_t mmu_page_size_sel0;
> +    uint32_t mmu_page_size_sel1;
> +    uint32_t mmu_pae_enabled;
> +    uint32_t ntlb_num_entries;
> +    uint32_t num_actionpoints;
> +    uint32_t number_of_interrupts;
> +    uint32_t number_of_levels;
> +    uint32_t pct_counters;
> +    uint32_t pct_interrupt;
> +    uint32_t pc_size;
> +    uint32_t rgf_num_regs;

Maybe use 'unsigned' for numbers (various uses).

> +    uint32_t rgf_banked_regs;
> +    uint32_t rgf_num_banks;
> +    bool     rtc_option;
> +    uint32_t rtt_feature_level;
> +    bool     stack_checking;
> +    bool     swap_option;
> +    uint32_t smar_stack_entries;
> +    uint32_t smart_implementation;
> +    uint32_t stlb_num_entries;
> +    uint32_t slc_size;
> +    uint32_t slc_line_size;
> +    uint32_t slc_ways;
> +    uint32_t slc_tag_banks;
> +    uint32_t slc_tram_delay;
> +    uint32_t slc_dbank_width;
> +    uint32_t slc_data_banks;
> +    uint32_t slc_dram_delay;
> +    bool     slc_mem_bus_width;
> +    uint32_t slc_ecc_option;
> +    bool     slc_data_halfcycle_steal;
> +    bool     slc_data_add_pre_pipeline;
> +    bool     uaux_option;
> +    uint32_t freq_hz; /* CPU frequency in hz, needed for timers. */
> +  } cfg;
> +
[...]
Regards,

Phil.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
