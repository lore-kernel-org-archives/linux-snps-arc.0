Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E10C433E1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 08:46:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9AB20674
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 08:46:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EvNFxTUw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B9AB20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JX49Tzb5Hd8HZZGcy4YaAyLTuaLBEC0nBG5/VgXdego=; b=EvNFxTUwacQct9
	/DUUcF8AOowPSHN8KZd1NPEzZI4xCqL6F1pLvbA4H3tOd8ZhAiPAikqI2JPBhBD3ez6rjKOm8BZLa
	6Qmk2q3x0kS5Y6+wa6VHmJLs0QU1a1P/Evkgx2d3KKidV+bNcuEDXeEzKBABYTmmpz/dEuawrDxSB
	2GZvjhGNpIWxrqE2uAZiTyeQn/uf2BUE6YYDDxCf6vff5Qg6wdC13usqNlLOZFt54dYWAW3Z3NfjT
	sbHy1P4/30TBPdsdvJdPzE/NOuWmmliXLGX4qUfn893zmO8DpKzZOtczTNYI7fz7yPAj3dVkV3Yzd
	DBx1FO5xGTvrILT5CszA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgP2n-0005oq-HB; Wed, 03 Jun 2020 08:46:41 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgP2k-0005nl-Jg
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 08:46:40 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 49cMvt0HgVz1rvBS;
 Wed,  3 Jun 2020 10:46:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 49cMvs6v8yz1qr41;
 Wed,  3 Jun 2020 10:46:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id P2urAz_-LwdV; Wed,  3 Jun 2020 10:46:32 +0200 (CEST)
X-Auth-Info: 8PB2oVdNgwy15NI8mWB+m+HhSAhjur+R+/cHlkKCNIqrp/ejnWHEdkd3Bp36vY/U
Received: from igel.home (ppp-46-244-166-134.dynamic.mnet-online.de
 [46.244.166.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  3 Jun 2020 10:46:32 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 26A252C0AB8; Wed,  3 Jun 2020 10:46:32 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Vineet Gupta via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [PATCH v3 1/4] iee754: provide gcc builtins based generic sqrt
 functions
References: <20200602213220.6201-1-vgupta@synopsys.com>
 <20200602213220.6201-2-vgupta@synopsys.com>
X-Yow: C'MON, everybody!!  I've flown in LESLIE GORE and two dozen KOSHER
 BUTCHERS!  They'll be doing intricate MILITARY MANEUVERS to the
 soundtrack from "OKLAHOMA"!!
Date: Wed, 03 Jun 2020 10:46:32 +0200
In-Reply-To: <20200602213220.6201-2-vgupta@synopsys.com> (Vineet Gupta via
 Libc-alpha's message of "Tue, 2 Jun 2020 14:32:17 -0700")
Message-ID: <87k10o4jvb.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_014638_789521_22216CC9 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

s/iee754/ieee754/

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
