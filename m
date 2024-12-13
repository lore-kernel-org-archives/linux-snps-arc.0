Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72971E7717F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 17:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAc8ImzAgaJwt40lOenR31xWqscbr964PgOs9dapzV0=; b=OYbVBGzTjxNxwr
	eHrLcgbr6lXBLXBk5OFXtLzYauPGWjdcXSfJpsxmiKqnR4s2aux8n9HP3yeSvvJLbnmRonyezsqyp
	fDboZYsNGG7n1cxlpcyHVAOSlpJtAjJFDOjZmtmSedipo1e7CtvVnnRBAh7kjFd9s2izZQqzD8KXB
	RDrYp/owohCdsEHQM3RcAGcwYSxpx/YMpTD2hAjJ+xbnYdpej2m3vTSZlbM1GERw8wUUe2KWlHiIp
	R2xXLWTkQY6usn+rMor9cXzeuqE4xgOKL/vhsSvphm1pbClZC8PRVZbNR+42MfWScLKg7TQ3CGSVL
	HUwX5xHvXEd5oDE3b+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9CB-00000004Wu9-0x0L;
	Fri, 13 Dec 2024 17:11:19 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM9C8-00000004WsA-2yvl
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 17:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734109877; x=1765645877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=43lcs1+73oMcgYgVNa8OI3qmg7j0TEA5KYxken4+b0I=;
  b=j8GwFWw7hAnm3J02hdzB0G+/GP1Ev/LTpvUIYU/MJsDTLJ6UXXUyHjRP
   IBcK0XxpUEawT+uk3wmo90xQpGZbbHOLYmSYVE+ELDXEc45DkUcjOsUI5
   tufzU4ST8ERs56itwhmODL0jM0z1dBgUfZ6QaHy+6Pz54/KB/KwLFTedI
   2LWcRSbUqfKHcZP/u2siVt7IVV2KrmQwHtiDLlrFfrHAoqlpD7MepC2R5
   YijTY3mVWWkAUq9V4gcBuU1ZodPBqIprQis6cCFKQYWE/yjqJiQf97xMZ
   NOjhtFm8Ua0EeyiNJ+eq8NR8OFCjLtYru4LAzX6xbk4xEYd5KPxIL0kyb
   g==;
X-CSE-ConnectionGUID: qHYUzdDeRQ+H5kBT0KPXAg==
X-CSE-MsgGUID: iSMfLU+bRKCEkR8W9kJ+gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45576433"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45576433"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 09:11:14 -0800
X-CSE-ConnectionGUID: THz8Mw9lT1KULhWa98pHdg==
X-CSE-MsgGUID: 088O5EVCSju/YnpNX2zO4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101560852"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 09:11:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tM9Bx-00000007Q2C-0sOT;
	Fri, 13 Dec 2024 19:11:05 +0200
Date: Fri, 13 Dec 2024 19:11:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Kalle Valo <kvalo@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Yafang Shao <laoar.shao@gmail.com>, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, x86@kernel.org,
	linux-snps-arc@lists.infradead.org, linux-wireless@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	ocfs2-devel@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
Message-ID: <Z1xqqENp6n6HZ_gM@smile.fi.intel.com>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-2-laoar.shao@gmail.com>
 <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
 <87r06crnew.fsf@kernel.org>
 <20241213132709.GAZ1w2LW4LgHi-6XfZ@fat_crate.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241213132709.GAZ1w2LW4LgHi-6XfZ@fat_crate.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_091116_794040_68CF9000 
X-CRM114-Status: UNSURE (   9.55  )
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

On Fri, Dec 13, 2024 at 02:27:09PM +0100, Borislav Petkov wrote:
> On Fri, Dec 13, 2024 at 10:35:03AM +0200, Kalle Valo wrote:
> > I agree, it makes the code harder to read for someone who is not
> > familiar with all the %p magic we have (like me).

> +1

And me too. In case one thinks of unprintable characters, %pE is for that.


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
