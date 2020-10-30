Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C8EC00A89
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 20:08:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D225206F7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 20:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHNdoV0C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="J7BZdQKA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L7SEammn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D225206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vXsPe5EB8zPVDPQdEPdLZzReZO/tOxyiMdP4uUcwFb8=; b=hHNdoV0CSyaxHSoTTvUPiOLB4
	/wsSfaQxc82MWQGAcLRtAMAzO8oVFpXwS7dOCu3k1NgTPYIggEfgBtCMrlIb5UhpsK+6L5EyAMolm
	vJVrKnNrTWL74X2Ri1c0Oron+y4N/IlZCUVcIUI7bFooG5p3UUhlLzhcACxl2YHGmlVQHBTkUGHVb
	kOREWvp/K3Lh2E5gulmWAxmydQkzBCVczqMCT7q+ee/PSlVCt00yCb49LvygBiqBp+jlWfSuIEWD0
	zff8+nL9EP0mBJGdPILligPhP4U/Zc4SX+f1/IzI1eweTonswj9W+ctibQ4mqfudlDGX3U3B7FtGj
	vy5fnIl4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYah7-0001EV-4S; Fri, 30 Oct 2020 20:08:17 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYah4-0001E9-TM
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 20:08:16 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C808C40515;
 Fri, 30 Oct 2020 20:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604088491; bh=5jm5Fs+S5cPiDscMAtAMsdDtrAfLf23yC53W/2ZU8mo=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=J7BZdQKAB9x0ZE0GmpttRVaNI547VdIqdWPm93vRZ+RhdXia5+npgk++WNYsppewr
 viPFhI8AXR7zDzYmni/NUhkffx4kmG+7XujSurM9mgkVptzcxwnRKuAiFVju6PzkkV
 086svqEl+xitgEPF0REFL81bNhlya4MRIAzaLmmvxd6aBYbADZTP+aY1QsqLEqGz5E
 OdnCr+nG15ex69MZp6iODi+oBlO258AE7d7xnbY9r5riM78eUgsNDkrqhwC0VsfBkY
 rBqHDIzIYxjAIi/j4iiE9JuBMdYKBq58gBEHqjg4v92Ih1pQEuadclnY8dWJSpACEk
 KJfKB8N8vmy0g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id D9109A0096;
 Fri, 30 Oct 2020 20:08:09 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id D042F80292;
 Fri, 30 Oct 2020 20:08:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="L7SEammn";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFDNJL8x0aKnAAZGvgBeIdMpaFb0UidbXtoOaq+A4moT7T/5gzuOpoicdi0p4uMUlE4kFvgIWegH6XGh9Igb2lI+0UsCrC3pYh13h/v+R0pISPohj3gF8D8uvFcozvE29NZKQ2WDQVbF9YU4DvEkTosL0WxNiA9Y3Dy3w+8PkXDdCt/UKKthp7QGHfFTu9Vkq65c0Vs39FN0r9VMPCeR9GTvH53MEIgjjLTgZ6Feadiglcpci3cWJBzYZpcKQfkxDTdtaCHRkdlv8jTzVDBBEyEwTAHUWsr2jUi1zSkvhZlzS7V2Utmim4Jsh5udzoRBp/lYmbdEAOTTGuutdbko9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jm5Fs+S5cPiDscMAtAMsdDtrAfLf23yC53W/2ZU8mo=;
 b=f+hAj/N+Daj9tv0pu5GD6O376h2SmZmKKkbqUu6f1EeNPYz1XbFEa0fKj22WtxhBxkU8jQqX3PSPOAZcqvfJf/nF2Iu04n+dIKq5DnIuWjJ/iTo4+VHkOOENi7e1AaYoPOpzcKU0PLS4MWuPkDb83W/ePPuwb3dggVMwN47v804ulZmKBaw0mB0vV8ezgDUKY6hE3bDqtBiSeYFIAZGkJMmna8SIoj3wWFKxSD26U9gGkQKnXC6uy1khwNy16h7IuTH1hfCokb2RcCmKDBRcuTdcc2avY7N0IeTvbiUe8Zpr95FrE6bpWvCqTTOr20rQ5yINbNu49nJXPpmDvoiWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jm5Fs+S5cPiDscMAtAMsdDtrAfLf23yC53W/2ZU8mo=;
 b=L7SEammnxUKULWr6ogZyiMvzD/g4Tk4ZyKsS4XiqvtTVKOw3hQjVeVlzXH05LJMx33xSjs1n+VWVDRHd7heOSbE3IqzDAm/MqTpaKzPOlb26CLIbOmS/y0sxmX8zyWtrczSCTkFbngkv8cegprNbm6hhwcpU4JLcOaB9ynGRQ+A=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3256.namprd12.prod.outlook.com (2603:10b6:a03:135::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 30 Oct
 2020 20:08:06 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3477.034; Fri, 30 Oct 2020
 20:08:06 +0000
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Jens Axboe <axboe@kernel.dk>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH] arc: add support for TIF_NOTIFY_SIGNAL
Thread-Topic: [PATCH] arc: add support for TIF_NOTIFY_SIGNAL
Thread-Index: AQHWrg31QcbIo8s3W0SB8T9Bc5NeLKmwfi8AgAABtQCAABTBgA==
Date: Fri, 30 Oct 2020 20:08:06 +0000
Message-ID: <f1a8b2c9-3a72-75c6-f504-18723689fabd@synopsys.com>
References: <6b89e805-c645-e738-794f-05ba6be68d60@kernel.dk>
 <faa0272e-9719-8fd4-323c-b32fd4c9ccb6@synopsys.com>
 <5d59c0f2-3a5e-478a-e0e4-4f487a4718a6@kernel.dk>
In-Reply-To: <5d59c0f2-3a5e-478a-e0e4-4f487a4718a6@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cb637ca-91f7-4d52-3712-08d87d0f8428
x-ms-traffictypediagnostic: BYAPR12MB3256:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3256EBE9930975B528CDC00FB6150@BYAPR12MB3256.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s6SHm2tg21jZuwxuZVD2AIWHOVymBh3R9oeSIHY1PsvoGJPEDEUTHY9SkKg2GAqSEpB/iDX9dCJYo/fwY1ogc3NBM8yAqSi12X2dhGKsTmz3HURUSbPreOFjmVgC6NMgjI5Lob+RSleWGrDaZNELjfcW2z8sWXfB9Q9S80SIG9Lh4K2OddHnzi7Xw+NlZoMDHCLCt7kkdziLyEtD1nAIAuTInRcG/HprujRtRrvpHUzYrR++rZ1BKTBqlzXup8J5Drm1wjl/3zg1DhryoCDIgNHOiJo8l0USlNnyjvwTIhhsSt3sNOMMD1XJc2WxDOCmZTeuyZIB4H5S+uswuNk7DL19MoYa95Rbh4zSTXl/iwpGqnu6ANAOU/bhzk8ShZxeUmJgftjWIjAqgtfeVEG/oEnHne44PawcwWQvv0nzelAwvGA9QzjY4hqAII7Na2zRi8+x5cOutPd+lzXhjIxygg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3479.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(966005)(64756008)(66946007)(66446008)(2906002)(6506007)(8676002)(31696002)(66556008)(76116006)(66476007)(6512007)(53546011)(4326008)(6486002)(26005)(316002)(478600001)(83380400001)(2616005)(186003)(86362001)(36756003)(31686004)(71200400001)(5660300002)(110136005)(8936002)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: cX0fuHpOLbDv04z7MslRunCJNeHiW1nBycNL1p6zNKQVqHAi4N5lsPJ5mFYgmO/z6ajNbjbi4BniJOOUQFOLDBGpbUoQDVxkTYbCIJNLPqA8YQh5s4+daeROjMo5vz5rYZE/iSbBO+OH5nG2Q5ullz2umvph2fF0zDNl/WyB67tCDVfa4cvLiU2W45rqR1JSIQfi0Z8wyQo6F80Odaqd3SC7MqYEpZEUsEZNibAqwJacg2aAECeJ4JQcM9VXYwjeXtoSARjFQa3MWN3CHd2cgrqEqLrPMRT+PQ1CIYXe2ts0D7TRWGt6hEF42FIbEk08EjQ56C7zwxujh7u/312TN430lZJg0pFa7koz2kjKWGUtW9duNZIzxgbPTnpos2lqq3Kp7VqKqpvJJVZuPboCoIjPlvs5IExpsAkHRfkOGAtUC8W9PA7Sh3RnVsBoMxuREqN4z0s6aFNYg395N0M8ePmt6WD0IBH6dO68zjAIdY2YoYEfEAp4gazzfto6M9DKdnloTBJV6JyyQ/WiMbW9M1X1okaRCsGnwsWtzOUo5zGiJiu7vpQKcRN1awNn8rJ0GAveHI+HRvPSKnTjYRojlhgnjs6R5kgJx1Tl8L/S4MYSfTQ/0Su9fOqzv0XCaSQF11qqVXHwvW7lZwhNeOaF7g==
Content-ID: <6353B9C4431B7F40A714EBA6148C90B9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb637ca-91f7-4d52-3712-08d87d0f8428
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 20:08:06.7045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdG5fE2p/YomTTAMsHdAzA9xy+TKf/yzh6g0pzlqoe1rPxV8/5C6xgT3nekQzUSnWuYWhg+SE+dZGbH9KSj3iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_160815_279291_D500AC0E 
X-CRM114-Status: GOOD (  25.25  )
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
Cc: open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/30/20 11:53 AM, Jens Axboe wrote:
>
> Ah thanks, I'll make that change. Hard for me to test a lot of these, so
> I really appreciate someone knowledgable taking a look at it.

Sure, glad to help, thx to you for writing the arch patches in first 
place. It takes a bit of daring to venture in unchartered waters ;-)

These days it is super easy to get your hands on a ARC cross toolchain. 
We don't have them shipping as regular distro packages just yet, but you 
can download a prebuilt @
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2020.09-release/arc_gnu_2020.09_prebuilt_glibc_le_archs_linux_install.tar.gz

Or you can just build upstream gcc + binutils for ARC if you so prefer.


>>>    
>>>    	; Normal Trap/IRQ entry only saves Scratch (caller-saved) regs
>>>    	; in pt_reg since the "C" ABI (kernel code) will automatically
>>> diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
>>> index 2be55fb96d87..a78d8f745a67 100644
>>> --- a/arch/arc/kernel/signal.c
>>> +++ b/arch/arc/kernel/signal.c
>>> @@ -362,7 +362,7 @@ void do_signal(struct pt_regs *regs)
>>>    
>>>    	restart_scall = in_syscall(regs) && syscall_restartable(regs);
>>>    
>>> -	if (get_signal(&ksig)) {
>>> +	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
>>>    		if (restart_scall) {
>>>    			arc_restart_syscall(&ksig.ka, regs);
>>>    			syscall_wont_restart(regs);	/* No more restarts */
>>
>> I've not seen your entire patchset, but it seems we are now hitting
>> do_signal() for either of TIF_{SIGPENDING|NOTIFY_SIGNAL} but then only
>> handling signal for TIF_SIGPENDING, so why even bother to come here. Do
>> you plan to add additional arch handling later ?
> Nope, that's all that's needed for each arch. The behavior you describe
> is how it works. It makes it so that TIF_SIGPENDING will do the signal
> delivery and syscall restart as it always has done, but
> TIF_NOTIFY_SIGNAL will only do the syscall restart. The latter is the
> intent, hence TIF_NOTIFY_SIGNAL provides a way to interrupt a process
> and have it process task_work without going through signal delivery like
> task_work with TWA_SIGNAL does today.

Nice, thx for explaining that.

>
> Updated version below:
>
>
> commit 3c6239647d95d03d1436bc826a004791c3f04617
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Mon Oct 12 07:15:37 2020 -0600
>
>      arc: add support for TIF_NOTIFY_SIGNAL
>      
>      Wire up TIF_NOTIFY_SIGNAL handling for arc.
>      
>      Cc: linux-snps-arc@lists.infradead.org
>      Signed-off-by: Jens Axboe <axboe@kernel.dk>

Acked-by: Vineet Gupta <vgupta@synopsys.com>

>
> diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
> index f9eef0e8f0b7..c0942c24d401 100644
> --- a/arch/arc/include/asm/thread_info.h
> +++ b/arch/arc/include/asm/thread_info.h
> @@ -79,6 +79,7 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
>   #define TIF_SIGPENDING		2	/* signal pending */
>   #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
>   #define TIF_SYSCALL_AUDIT	4	/* syscall auditing active */
> +#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
>   #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
>   
>   /* true if poll_idle() is polling TIF_NEED_RESCHED */
> @@ -89,11 +90,12 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
>   #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
>   #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
>   #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
> +#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
>   #define _TIF_MEMDIE		(1<<TIF_MEMDIE)
>   
>   /* work to do on interrupt/exception return */
>   #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
> -				 _TIF_NOTIFY_RESUME)
> +				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
>   
>   /*
>    * _TIF_ALLWORK_MASK includes SYSCALL_TRACE, but we don't need it.
> diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
> index ea00c8a17f07..1f5308abf36d 100644
> --- a/arch/arc/kernel/entry.S
> +++ b/arch/arc/kernel/entry.S
> @@ -307,7 +307,8 @@ resume_user_mode_begin:
>   	mov r0, sp	; pt_regs for arg to do_signal()/do_notify_resume()
>   
>   	GET_CURR_THR_INFO_FLAGS   r9
> -	bbit0  r9, TIF_SIGPENDING, .Lchk_notify_resume
> +	and.f  0,  r9, TIF_SIGPENDING|TIF_NOTIFY_SIGNAL
> +	bz .Lchk_notify_resume
>   
>   	; Normal Trap/IRQ entry only saves Scratch (caller-saved) regs
>   	; in pt_reg since the "C" ABI (kernel code) will automatically
> diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
> index 2be55fb96d87..a78d8f745a67 100644
> --- a/arch/arc/kernel/signal.c
> +++ b/arch/arc/kernel/signal.c
> @@ -362,7 +362,7 @@ void do_signal(struct pt_regs *regs)
>   
>   	restart_scall = in_syscall(regs) && syscall_restartable(regs);
>   
> -	if (get_signal(&ksig)) {
> +	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
>   		if (restart_scall) {
>   			arc_restart_syscall(&ksig.ka, regs);
>   			syscall_wont_restart(regs);	/* No more restarts */
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
