From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 24 Sep 2018 17:37:20 +0000
Subject: [REVIEW][PATCH 1/2] signal/arc: Push siginfo generation into
 unhandled_exception
References: <874lef2bqn.fsf@xmission.com>
 <20180924144910.14902-1-ebiederm@xmission.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B096A87@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/24/2018 07:49 AM, Eric W. Biederman wrote:
> Pass signr, sicode, and address into unhandled_exception as explicit
> parameters instead of members of struct siginfo.  Then in unhandled
> exception generate and send the siginfo using force_sig_fault.
>
> This keeps the code simpler and less error prone.
>
> Signed-off-by: "Eric W. Biederman" <ebiederm at xmission.com>

LGTM.

Acked-by: Vineet Gupta <vgupta at synopsys.com>

Thx,
-Vineet
