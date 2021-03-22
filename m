Return-Path: <SRS0=RmAe=IU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECE4C433E2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 13:26:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F1B26191F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 13:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F1B26191F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ymNqoqLnT0vaJvK16nR/SPTskECpwZXvnGJ3wMsOf6Y=; b=PY31NFwgtPp9KHWRgpnNytsoF
	+WMl/pctPmXCdPKpcoCN+Nn8CZUiC07Xjr0cC8mhiSWqmkd4j/vZXRyrBRiYvh8YJg2YdBL4vz0oQ
	PV+fDPFoKtni+3iO5PTgikGEjNp8+hgrXEpufp71bI0bX0xI3OPVgqi5fydzEQ/EkVzH7giKVYSUv
	lZuUDomJiFvrHeefRxMuZg04K3F6w7t7YuT8ZMc7r7FCLmaJ3ZNF8s68fNWAetWbsff46oR4OR6oW
	IDzQ5j6mX+EL2BiOhhNRkCy8lMKWPfdK0+f9mlx+CigvDgIP5gk1a+WnYuOP89VdDnM2YHwD2pytF
	d7uHrCmPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOKZz-00Bhk1-Cx; Mon, 22 Mar 2021 13:26:47 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOKWo-00BhBh-7Z
 for linux-snps-arc@lists.infradead.org; Mon, 22 Mar 2021 13:25:32 +0000
Received: from ip5f5af0a0.dynamic.kabel-deutschland.de ([95.90.240.160]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1lOKWZ-00010X-8A; Mon, 22 Mar 2021 13:23:15 +0000
Date: Mon, 22 Mar 2021 14:23:14 +0100
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: vgupta@synopsys.com, akpm@linux-foundation.org, keescook@chromium.org,
 shorne@gmail.com, walken@google.com, viro@zeniv.linux.org.uk,
 jhubbard@nvidia.com, daniel.m.jordan@oracle.com,
 tsbogend@alpha.franken.de, peterx@redhat.com, axboe@kernel.dk,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
Subject: Re: [PATCH] arcc/kernel/process: Few mundane typo fixes
Message-ID: <20210322132314.mtky3gx2oqqucoob@wittgenstein>
References: <20210322125155.3401540-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322125155.3401540-1-unixbhaskar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_132530_880173_C900EBD4 
X-CRM114-Status: UNSURE (   5.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Mar 22, 2021 at 06:21:55PM +0530, Bhaskar Chowdhury wrote:
> s/defintion/definition/
> s/succeded/succeeded/
> s/commiting/committing/
> s/interrutps/interrupts/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---

Since you aim to be mirroring the path arc/kernel/process there's a typo
in the patch subject :)
s/arcc/arc/

otherwise

Reviewed-by: Christian Brauner <christian.brauner@ubuntu.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
